class User < ActiveRecord::Base
  has_many :user_sports
  has_many :sports, through: :user_sports
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.now + auth.credentials.expires_at
      user.picture = auth.info.image
      user.refresh_token = auth.credentials.refresh_token
      #byebug
      user.save!
    end
  end
  
  def to_params
    {'refresh_token' => self.refresh_token,
    'client_id' => "915735438771-ee0msacribn2n52lqb8mge1p51pt7aii.apps.googleusercontent.com",
    'client_secret' => "LhRKxXqc6eRlGf5ixfSe7yNg",
    'grant_type' => 'refresh_token'}
  end
 
  def request_token_from_google
    url = URI("https://accounts.google.com/o/oauth2/token")
    byebug
    Net::HTTP.post_form(url, self.to_params)
  end
 
  def refresh!
    response = request_token_from_google
    data = JSON.parse(response.body)
    byebug
    self.oauth_token =  data['access_token']
    self.oauth_expires_at = Time.now + data['expires_in']
    self.save!
  end

  def expired?
    if self.oauth_expires_at.to_i < Time.now.to_i
      return true
    else
      return false
    end
  end
 
 private
 
  def fresh_token
    self.refresh! if self.expired?
    self.oauth_token
  end
 
end
  
  
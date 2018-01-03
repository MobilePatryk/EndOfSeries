OmniAuth.config.logger = Rails.logger
if Rails.env.production?
    
    
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['OACLIENT'], ENV['OASECRET'],{
      :hd => 'decathlon.com'
  }
  end
  
else

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "915735438771-ee0msacribn2n52lqb8mge1p51pt7aii.apps.googleusercontent.com", "LhRKxXqc6eRlGf5ixfSe7yNg", {
      :hd => 'decathlon.com',
      prompt: "consent",
      access_type: "offline",
      scope: "calendar.readonly,email,profile,analytics.readonly"
  }
end

end

  
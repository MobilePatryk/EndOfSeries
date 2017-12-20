OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['OACLIENT'], ENV['OASECRET'],{
      :hd => 'decathlon.com'
  }
end
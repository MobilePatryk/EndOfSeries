OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "915735438771-66k6hpoc907cl2ftnn0pig6vagomtgff.apps.googleusercontent.com", "W-D9G9XhHpYRWhbm59hykEWn"
end
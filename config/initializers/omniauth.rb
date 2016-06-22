Rails.application.config.middleware.use OmniAuth::Builder do
   provider :facebook, Rails.application.secrets.facebook_api_key, Rails.application.secrets.facebook_api_secret, :scope => "email"
 end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.google_api_key, Rails.application.secrets.google_api_secret, {
  scope: ['email', 'https://www.googleapis.com/auth/plus.login']}
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, Rails.application.secrets.linkedin_api_key, Rails.application.secrets.linkedin_api_secret
end

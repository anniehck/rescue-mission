OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '624452694424064', '8be697f91446c907e52f7b36c3657031'
end

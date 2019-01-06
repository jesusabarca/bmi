# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    Rails.configuration.auth0['client_id'],
    Rails.application.credentials.auth0.try(:fetch, :client_secret),
    Rails.configuration.auth0['namespace'],
    callback_path: Rails.configuration.auth0['callback_path'],
    authorize_params: {
      scope: 'openid email profile',
    }
  )
end

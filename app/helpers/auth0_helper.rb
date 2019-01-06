# frozen_string_literal: true

module Auth0Helper
  def auth0_logout_url
    domain = Rails.configuration.auth0['namespace']
    client_id = Rails.configuration.auth0['client_id']
    request_params = {
      returnTo: root_url,
      client_id: client_id
    }

    URI::HTTPS.build(
      host: domain,
      path: '/v2/logout',
      query: request_params.to_query
    ).to_s
  end
end

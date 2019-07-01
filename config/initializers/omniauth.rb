Rails.application.config.middleware.use OmniAuth::Builder do
# frozen_string_literal: true

provider :shopify,
  ShopifyApp.configuration.api_key,
  ShopifyApp.configuration.secret,
  scope: ShopifyApp.configuration.scope,
  setup: lambda { |env|
    strategy = env['omniauth.strategy']

    shopify_auth_params = strategy.session['shopify.omniauth_params']&.with_indifferent_access
    shop = if shopify_auth_params.present?
      "https://#{shopify_auth_params[:shop]}"
    else
      ''
    end

    strategy.options[:client_options][:site] = shop
    strategy.options[:old_client_secret] = ShopifyApp.configuration.old_secret
    # customize callback url here, refer here
    # /Users/taitran/.rbenv/versions/2.6.1/lib/ruby/gems/2.6.0/gems/shopify_app-10.0.0/app/controller/
    # strategy.options[:callback_url] = ''
  }
  # https://github.com/omniauth/omniauth-oauth2/issues/95
  # FIXME: /Users/taitran/.rbenv/versions/2.6.1/lib/ruby/gems/2.6.0/gems/omniauth-shopify-oauth2-2.1.0/test/
  # provider_ignores_state: true
end

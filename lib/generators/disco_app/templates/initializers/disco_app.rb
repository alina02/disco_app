DiscoApp::Engine.routes.default_url_options[:host] = ENV['DEFAULT_HOST']

DiscoApp.configure do |config|
  config.skip_proxy_verification = ENV['SKIP_PROXY_VERIFICATION']
  config.skip_webhook_verification = ENV['SKIP_WEBHOOK_VERIFICATION']
  config.skip_carrier_request_verification = ENV['SKIP_CARRIER_REQUEST_VERIFICATION']
end

require 'sidekiq/web'
sidekiq_config = {
  db: 1,
  host: ENV['REDIS_HOST'],
  port: ENV['REDIS_PORT'],
  password: ENV['REDIS_PASSWORD']
}
Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end
Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end

Sidekiq::Web.use(Rack::Session::Cookie, secret: ENV['RACK_SESSION_COOKIE'] || 'SOMETHING SECRET')
Sidekiq::Web.use(Rack::Auth::Basic) do |username, password|
  ENV['ADMIN_USERNAME'].present? && ENV['ADMIN_PASSWORD'].present? &&
    username == ENV['ADMIN_USERNAME'] &&
    password == ENV['ADMIN_PASSWORD']
end

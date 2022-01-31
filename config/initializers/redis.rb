redis_current_params = if Rails.env.development?
    {
      db: 1,
      host: ENV["REDIS_HOST"],
      port: ENV["REDIS_PORT"],
      password: ENV["REDIS_PASSWORD"],

    }
  else
    { url: ENV["REDISCLOUD_URL"] }
  end
Redis.current = Redis.new(
  redis_current_params
)

if ENV['RAILS_ENV'] != 'test'
  Coverband.configure do |config|
    #config.store = Coverband::Adapters::RedisStore.new(Redis.new(db: 1, host: ENV['REDIS_HOST'], port: ENV['REDIS_PORT'], password: ENV['REDIS_PASSWORD']))
    config.logger = Rails.logger

    # config options false, true. (defaults to false)
    # true and debug can give helpful and interesting code usage information
    # and is safe to use if one is investigating issues in production, but it will slightly
    # hit perf.
    config.verbose = false

    # default false. button at the top of the web interface which clears all data
    config.web_enable_clear = true

    # default false. Experimental support for tracking view layer tracking.
    # Does not track line-level usage, only indicates if an entire file
    # is used or not.
    config.track_views = true
  end
end

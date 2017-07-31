redis_url = ENV['REDIS_PROVIDER'] || ENV['REDISTOGO_URL']

Sidekiq.configure_server do |config|
  config.redis = {  url: redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end

Rails.application.config.active_job.queue_adapter = :sidekiq

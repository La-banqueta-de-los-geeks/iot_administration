class MyWorker
  include Sidekiq::Worker
  def perform(name, count)
    logger.info "#{name} says the count is #{count}"
  end
end
# 10000.times do |index|
#   #MyWorker.perform_async "Bobby", index
#   MyWorker.perform_in(2, "Bobby", index)
# end
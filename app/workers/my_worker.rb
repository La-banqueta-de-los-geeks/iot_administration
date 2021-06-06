class MyWorker
  include Sidekiq::Worker
  def perform(device_port, _count)
    # 1000.times { |i| Redis.current.publish name, "{\"message\":\"Hello world from Asgardian! #{i} \"}" }
    Redis.current.publish :device_port_option, {
      Device: device_port.device.as_json,
      DevicePort: device_port.as_json,
      DevicePortOption: {}
    }
  end
end
# 100.times do |index|
#   MyWorker.perform_async "Bobby", index
#   #MyWorker.perform_in(2, "Bobby", index)
# end
# 1000.times{MyWorker.perform_async "notification", 0}

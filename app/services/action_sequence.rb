class ActionSequence
  attr_accessor :device, :device_port_ids, :time

  def initialize(device, device_port_ids, time)
    @device = device
    @device_port_ids = device_port_ids
    @time = time
  end

  def call(status)
    statuses.each{|status|    device_ports_update( status) }
  end

  private

  def statuses
    %w[ON OFF]
  end

  def device_ports
    if defined?(@device_ports)
      @device_ports
    else
      @device_ports = device.device_ports.where(id: [device_port_ids])
    end
  end

  def device_ports_update(status)
    device_ports.update(status: status)
    sleep(time) if status == "ON"
  end
end

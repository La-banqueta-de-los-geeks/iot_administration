json.device_ports @device_ports, partial: 'v1/devices/device_ports/device_port', as: :device_port
json.device_port_errors @device_ports_errors, partial: 'v1/devices/device_ports/device_port_error', as: :device_port_error if @device_ports_errors && @device_ports_errors.size > 0

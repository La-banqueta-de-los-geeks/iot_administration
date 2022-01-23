json.extract! device, :id, :status, :name, :organization_id, :created_at, :updated_at, :device_token
json.device_groups device.device_groups, partial: 'v1/devices/device_groups/device_group', as: :device_group

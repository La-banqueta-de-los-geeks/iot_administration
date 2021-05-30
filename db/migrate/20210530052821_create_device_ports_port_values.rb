class CreateDevicePortsPortValues < ActiveRecord::Migration[6.0]
  def change
    create_table :device_ports_port_values do |t|
      t.references :device_port, null: false, foreign_key: true
      t.references :port_value, null: false, foreign_key: true

      t.timestamps
    end
  end
end

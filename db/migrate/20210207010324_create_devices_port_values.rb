class CreateDevicesPortValues < ActiveRecord::Migration[6.0]
  def change
    create_table :devices_port_values do |t|
      t.references :device, null: false, foreign_key: true
      t.references :port_value, null: false, foreign_key: true

      t.timestamps
    end
  end
end

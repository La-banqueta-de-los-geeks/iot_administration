class CreateDevicePorts < ActiveRecord::Migration[6.0]
  def change
    create_table :device_ports do |t|
      t.references :device, null: false, foreign_key: true
      t.string :status
      t.string :port

      t.timestamps
    end
  end
end

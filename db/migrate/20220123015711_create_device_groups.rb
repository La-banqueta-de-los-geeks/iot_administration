class CreateDeviceGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :device_groups do |t|
      t.string :name
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end

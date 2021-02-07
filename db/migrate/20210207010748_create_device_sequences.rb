class CreateDeviceSequences < ActiveRecord::Migration[6.0]
  def change
    create_table :device_sequences do |t|
      t.references :device, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end

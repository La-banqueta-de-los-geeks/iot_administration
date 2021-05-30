class CreateSequences < ActiveRecord::Migration[6.0]
  def change
    create_table :sequences do |t|
      t.references :device_sequence, null: false, foreign_key: true
      t.references :device_port, null: false, foreign_key: true
      t.references :port_value, null: false, foreign_key: true

      t.timestamps
    end
  end
end

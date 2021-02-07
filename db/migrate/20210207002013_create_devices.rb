class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end

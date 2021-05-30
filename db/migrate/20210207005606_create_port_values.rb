class CreatePortValues < ActiveRecord::Migration[6.0]
  def change
    create_table :port_values do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end

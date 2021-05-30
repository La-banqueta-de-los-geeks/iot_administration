class CreateTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.string :token
      t.references :entity, polymorphic: true, index: true

      t.timestamps
    end
  end
end

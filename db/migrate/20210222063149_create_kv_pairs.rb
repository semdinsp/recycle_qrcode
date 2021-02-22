class CreateKvPairs < ActiveRecord::Migration[6.1]
  def change
    create_table :kv_pairs, id: :uuid do |t|
      t.integer :key
      t.string :value
      t.references :entity, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

class CreateActiontypes < ActiveRecord::Migration[6.1]
  def change
    create_table :actiontypes, id: :uuid do |t|
      t.references :entity, null: false, foreign_key: true, type: :uuid
      t.references :location, null: false, foreign_key: true, type: :uuid
      t.string :user
      t.integer :atype

      t.timestamps
    end
  end
end

class CreateEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :entities, id: :uuid do |t|
      t.string :name
      t.integer :etype
      t.integer :status

      t.timestamps
    end
  end
end

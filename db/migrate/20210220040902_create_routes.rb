class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes, id: :uuid do |t|
      t.references :truck, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :info
      t.string :dayofweek

      t.timestamps
    end
  end
end

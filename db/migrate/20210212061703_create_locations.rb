class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations, id: :uuid do |t|
      t.float :latitude
      t.float :longitude
      t.references :entity, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

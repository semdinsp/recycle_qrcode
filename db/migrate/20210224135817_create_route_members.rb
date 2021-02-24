class CreateRouteMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :route_members, id: :uuid do |t|
      t.integer :route_order
      t.references :route, null: false, foreign_key: true, type: :uuid
      t.references :entity, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
     add_reference :locations, :locatable, type: :uuid, polymorphic: true

    #add_reference :locations, :locatable,  polymorphic: true
    remove_column :actiontypes, :location_id, :uuid
    change_column :locations, :entity_id, :uuid, null: true

  end
end

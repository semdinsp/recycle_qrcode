class AddLocationToEntity < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :location_id, :uuid
    add_column :locations, :actiontype_id, :uuid

  end
end

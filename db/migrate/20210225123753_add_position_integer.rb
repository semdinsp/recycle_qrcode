class AddPositionInteger < ActiveRecord::Migration[6.1]
  def change
    add_column :route_members, :position, :integer
  end
end

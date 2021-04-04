class TrackableEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :actiontypes, :trackable_type, :string
    add_column :actiontypes, :trackable_id, :uuid
    add_index :actiontypes, ["trackable_type", "trackable_id"]

  end
end

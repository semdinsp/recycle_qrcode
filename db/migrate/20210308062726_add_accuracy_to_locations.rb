class AddAccuracyToLocations < ActiveRecord::Migration[6.1]
  def change
     add_column :locations, :accuracy, :string, default: 'not set'
  end
end

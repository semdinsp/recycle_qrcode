class AddIndexActiontypes < ActiveRecord::Migration[6.1]
  def change
     add_index :actiontypes, [:atype]
  end
end

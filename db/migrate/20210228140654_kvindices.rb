class Kvindices < ActiveRecord::Migration[6.1]
  def change
    add_index :kv_pairs, [ :key]
  #  add_index :entities, [ :location_id]


  end
end

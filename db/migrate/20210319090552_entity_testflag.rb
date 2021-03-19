class EntityTestflag < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :testflag, :boolean, default: false
  end
end

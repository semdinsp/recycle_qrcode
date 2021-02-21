class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks, id: :uuid do |t|
      t.string :name
      t.string :license
      t.string :owner

      t.timestamps
    end
  end
end

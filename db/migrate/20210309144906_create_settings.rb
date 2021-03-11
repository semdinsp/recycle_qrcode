class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings, id: :uuid do |t|
      t.string :host
      t.string :port
      t.float :centerlat
      t.float :centerlong
      t.float :zoom

      t.timestamps
    end

  end
end

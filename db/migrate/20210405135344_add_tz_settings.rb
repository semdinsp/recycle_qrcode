class AddTzSettings < ActiveRecord::Migration[6.1]
  def change
    add_column :settings, :timezone, :string, default: 'Asia/Tokyo'
  end
end

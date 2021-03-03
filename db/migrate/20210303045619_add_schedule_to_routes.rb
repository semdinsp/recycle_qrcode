class AddScheduleToRoutes < ActiveRecord::Migration[6.1]
  def change
    add_column :routes, :schedule, :string, default: ""
  end
end

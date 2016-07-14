class AddDailyMenuIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :daily_menu_id, :integer
  end
end

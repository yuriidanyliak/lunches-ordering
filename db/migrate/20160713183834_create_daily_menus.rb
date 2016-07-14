class CreateDailyMenus < ActiveRecord::Migration
  def change
    create_table :daily_menus do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end

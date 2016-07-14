class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :first_course_id
      t.integer :main_course_id
      t.integer :drink_course_id

      t.timestamps null: false
    end
  end
end

ActiveAdmin.register Order do
  menu priority: 3, label: 'Total orders by today'

  scope :of_today, default: true

  index do
    panel 'Total cost of lunch today' do
      Order.total_cost_for_today
    end
    column :user
    column :first_course
    column :main_course
    column 'Drink' do |order|
      link_to order.drink_course.name, admin_course_path(order.drink_course)
    end
    actions
  end

  show do
    attributes_table do
      row :user
      row :first_course
      row 'First course photo' do |order|
        image_tag(order.first_course.image.url(:thumb), :height => '200')
      end
      row :main_course
      row 'Main course photo' do |order|
        image_tag(order.main_course.image.url(:thumb), :height => '200')
      end
      row 'Drink' do |order|
        link_to order.drink_course.name, admin_course_path(order.drink_course)
      end
      row 'Drink photo' do |order|
        image_tag(order.drink_course.image.url(:thumb), :height => '200')
      end
    end
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end

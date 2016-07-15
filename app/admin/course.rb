ActiveAdmin.register Course do
  menu priority: 5
  index do
    column :name
    column :price
    column 'Date' do |course|
      course.daily_menu.date.strftime('%A, %B %d')
    end
    column 'Image' do |course|
      image_tag(course.image.url(:thumb), :height => '100')
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row 'Date' do |course|
        course.daily_menu.date.strftime('%A, %B %d')
      end
      row 'Image' do |course|
        image_tag(course.image.url(:thumb), :height => '100')
      end
    end
  end
end

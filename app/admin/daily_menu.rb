ActiveAdmin.register DailyMenu do
  menu priority: 2, label: 'Menu for today'

  before_filter :skip_sidebar!

  permit_params :date,
                first_courses_attributes: [:id, :name, :price, :image, :_destroy],
                main_courses_attributes: [:id, :name, :price, :image, :_destroy],
                drink_courses_attributes: [:id, :name, :price, :image, :_destroy]

  config.clear_action_items!

  actions :all, :except => [:show]

  form do |f|
    panel 'Please choose your lunch for today' do
      "Today is #{Date.today.strftime('%A, %B %d')}"
    end
    f.inputs 'First Courses' do
      f.has_many :first_courses, heading: false, allow_destroy: true do |c|
        c.input :name
        c.input :price
        c.input :image, :as => :file, :hint => c.template.image_tag(c.object.image.url(:thumb))
      end
    end
    f.inputs 'Main Courses' do
      f.has_many :main_courses, heading: false, allow_destroy: true do |c|
        c.input :name
        c.input :price
        c.input :image, :as => :file, :hint => c.template.image_tag(c.object.image.url(:thumb))
      end
    end
    f.inputs 'Drinks' do
      f.has_many :drink_courses, heading: false, allow_destroy: true do |c|
        c.input :name
        c.input :price
        c.input :image, :as => :file, :hint => c.template.image_tag(c.object.image.url(:thumb))
      end
    end
    f.actions
  end

  controller do
    def scoped_collection
      super.where(date: Date.today)
    end
  end

  index do
    column 'First Courses' do |menu|
      menu.first_courses.map do |course|
        link_to(course.name, admin_course_path(course))
      end.join('<br />').html_safe
    end
    column 'Main Courses' do |menu|
      menu.main_courses.map do |course|
        link_to(course.name, admin_course_path(course))
      end.join('<br />').html_safe
    end
    column 'Drinks' do |menu|
      menu.drink_courses.map do |course|
        link_to(course.name, admin_course_path(course))
      end.join('<br />').html_safe
    end
    actions
  end

end

ActiveAdmin.register DailyMenu do
  menu priority: 2, label: 'Menu for today'

  before_filter :skip_sidebar!

  permit_params :date,
                first_courses_attributes: [:id, :name, :price, :image, :_destroy],
                main_courses_attributes: [:id, :name, :price, :image, :_destroy],
                drink_courses_attributes: [:id, :name, :price, :image, :_destroy]

  config.clear_action_items!

  actions :all, :except => [:show]

  form do |form|
    panel 'Please choose your lunch for today' do
      "Today is #{Date.today.strftime('%A, %B %d')}"
    end
    form.inputs 'First Courses' do
      form.has_many :first_courses, allow_destroy: true do |course|
        course.input :name
        course.input :price
        course.input :image, :as => :file, :hint => course.template.image_tag(course.object.image.url(:thumb))
      end
    end
    form.inputs 'Main Courses' do
      form.has_many :main_courses, allow_destroy: true do |course|
        course.input :name
        course.input :price
        course.input :image, :as => :file, :hint => course.template.image_tag(course.object.image.url(:thumb))
      end
    end
    form.inputs 'Drinks' do
      form.has_many :drink_courses, allow_destroy: true do |course|
        course.input :name
        course.input :price
        course.input :image, :as => :file, :hint => course.template.image_tag(course.object.image.url(:thumb))
      end
    end
    form.actions
  end

  controller do
    def scoped_collection
      super.where(date: Time.zone.now.to_date)
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

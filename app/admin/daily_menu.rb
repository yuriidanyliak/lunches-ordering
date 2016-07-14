ActiveAdmin.register DailyMenu do
  menu label: 'Menu for today'

  before_filter :skip_sidebar!

  config.clear_action_items!

  actions :all, :except => [:show]

  form do |f|
    panel 'Please choose your lunch for today' do
      "Today is #{Date.today.strftime('%A, %B %d')}"
    end
    f.inputs :name => 'First Course', :for => :first_course do |c|
      c.input :name
      c.input :price
      c.input :image, :as => :file, :hint => c.template.image_tag(c.object.image.url(:thumb))
    end
    f.inputs :name => 'Main Course', :for => :main_course do |c|
      c.input :name
      c.input :price
      c.input :image, :as => :file, :hint => c.template.image_tag(c.object.image.url(:thumb))
    end
    f.inputs :name => 'Drink', :for => :drink_course do |c|
      c.input :name
      c.input :price
      c.input :image, :as => :file, :hint => c.template.image_tag(c.object.image.url(:thumb))
    end
    f.actions
  end

  controller do
    def scoped_collection
      super.where(date: Date.today)
    end

    def new
      @daily_menu = DailyMenu.new
      @daily_menu.build_first_course
      @daily_menu.build_main_course
      @daily_menu.build_drink_course
    end

    def permitted_params
      params.permit! # allow all parameters
    end
  end

  index do
    column 'First Course' do |menu|
      menu.first_course.name + ', costs ' + menu.first_course.price.to_s
    end
    column 'First Course Photo' do |menu|
      image_tag(menu.first_course.image.url(:thumb), :height => '100')
    end
    column 'Main Course' do |menu|
      menu.main_course.name + ', costs ' + menu.main_course.price.to_s
    end
    column 'Main Course Photo' do |menu|
      image_tag(menu.main_course.image.url(:thumb), :height => '100')
    end
    column 'Drink' do |menu|
      menu.drink_course.name + ', costs ' + menu.drink_course.price.to_s
    end
    column 'Drink Photo' do |menu|
      image_tag(menu.drink_course.image.url(:thumb), :height => '100')
    end
    actions
  end

end

ActiveAdmin.register DailyMenu do
  menu label: 'Menu for today'

  before_filter :skip_sidebar!

  config.clear_action_items! if [:index]

  form do |f|
    panel 'Please choose your lunch for today' do
      "Today is #{Date.today.strftime('%A, %B %d')}"
    end
    f.inputs :name => 'First Course', :for => :first_course do |c|
      c.input :name
      c.input :price
    end
    f.inputs :name => 'Main Course', :for => :main_course do |c|
      c.input :name
      c.input :price
    end
    f.inputs :name => 'Drink', :for => :drink_course do |c|
      c.input :name
      c.input :price
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
      # params.permit(:blog => [:name, :description])
      params.permit! # allow all parameters
    end
  end

  index do
    column 'First Course' do |menu|
      menu.first_course.name + ', costs ' + menu.first_course.price.to_s
    end
    column 'Main Course' do |menu|
      menu.main_course.name + ', costs ' + menu.main_course.price.to_s
    end
    column 'Drink' do |menu|
      menu.drink_course.name + ', costs ' + menu.drink_course.price.to_s
    end
    actions
    config.clear_action_items!
  end

  show do
    attributes_table do
      row 'First Course' do |menu|
        menu.first_course.name + ', costs ' + menu.first_course.price.to_s
      end
      row 'Main Course' do |menu|
        menu.main_course.name + ', costs ' + menu.main_course.price.to_s
      end
      row 'Drink' do |menu|
        menu.drink_course.name + ', costs ' + menu.drink_course.price.to_s
      end
    end
  end

end

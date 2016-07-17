class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all
    @admin = admin?
  end

  def new
    @order = Order.new
    @first_courses = FirstCourse.where('DATE(created_at) = ?', Time.zone.now.to_date)
    @main_courses = MainCourse.where('DATE(created_at) = ?', Time.zone.now.to_date)
    @drinks = DrinkCourse.where('DATE(created_at) = ?', Time.zone.now.to_date)
  end

  def create
    order = Order.new(order_params)
    order.save!
    flash[:notice] = 'Order successfully created'
    redirect_to root_path
  rescue Exception => e
    flash[:alert] = 'There was some error while trying to save your post.'
    puts e.message
    puts e.backtrace.inspect
  end

  private

  def admin?
    params[:admin] == 'true'
  end

  def order_params
    params.require(:order).permit(:user_id, :first_course_id, :main_course_id, :drink_course_id)
  end
end

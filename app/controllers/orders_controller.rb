class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @admin = admin?
  end

  private

  def admin?
    params[:admin] == 'true'
  end
end

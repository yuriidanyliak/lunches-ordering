class DailyMenusController < ApplicationController
  before_action :authenticate_user!

  def show
    @daily_menu = DailyMenu.find(params[:id])
  end
end

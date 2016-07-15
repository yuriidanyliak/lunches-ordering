class DailyMenusController < ApplicationController
  def show
    @daily_menu = DailyMenu.find(params[:id])
  end
end

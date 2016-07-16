class ApiOrdersController < ApplicationController
  before_filter :parse_request, :authenticate_by_token!

  def index
    @orders = Order.of_today.includes(:user, :first_course, :main_course, :drink_course)
  end

  private

  def authenticate_by_token!
    if !@json['access_token']
      render nothing: true, status: :unauthorized
    else
      @user = nil
      User.find_each do |user|
        if Devise.secure_compare(user.access_token, @json['access_token'])
          @user = user
        end
      end
    end
  end

  def parse_request
    @json = JSON.parse(request.body.read)
  end

end
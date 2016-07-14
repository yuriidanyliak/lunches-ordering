class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :first_course
  belongs_to :main_course
  belongs_to :drink_course
end

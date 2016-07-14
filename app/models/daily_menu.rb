class DailyMenu < ActiveRecord::Base
  before_validation :set_date
  validates_uniqueness_of :date

  has_one :first_course
  has_one :main_course
  has_one :drink_course
  accepts_nested_attributes_for :first_course
  accepts_nested_attributes_for :main_course
  accepts_nested_attributes_for :drink_course

  private

  def set_date
    self.date = Date.today
  end
end

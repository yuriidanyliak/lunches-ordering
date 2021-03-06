class DailyMenu < ActiveRecord::Base
  before_validation :set_date
  validates_uniqueness_of :date

  has_many :first_courses
  has_many :main_courses
  has_many :drink_courses
  accepts_nested_attributes_for :first_courses, allow_destroy: true
  accepts_nested_attributes_for :main_courses, allow_destroy: true
  accepts_nested_attributes_for :drink_courses, allow_destroy: true

  private

  def set_date
    self.date = Time.zone.now.to_date
  end
end

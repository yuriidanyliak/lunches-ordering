class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :first_course
  belongs_to :main_course
  belongs_to :drink_course

  validates_presence_of :first_course
  validates_presence_of :main_course
  validates_presence_of :drink_course

  scope :of_today, -> { where('DATE(orders.created_at) = ?', Date.today) }

  def self.total_cost_for_today
    of_today.joins(:first_course).sum(:price) +
        of_today.joins(:main_course).sum(:price) +
        of_today.joins(:drink_course).sum(:price)
  end

end

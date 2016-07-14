class Course < ActiveRecord::Base
  belongs_to :daily_menu

  validates_presence_of :name
  validates :price, presence: true, numericality: true

  self.inheritance_column = :course_type

  def self.course_types
    %w(FirstCourse MainCourse DrinkCourse)
  end

  mount_uploader :image, ImageUploader
end

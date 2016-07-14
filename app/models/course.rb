class Course < ActiveRecord::Base
  belongs_to :daily_menu

  self.inheritance_column = :course_type

  def self.course_types
    %w(FirstCourse MainCourse DrinkCourse)
  end
end

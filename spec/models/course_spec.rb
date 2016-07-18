require 'rails_helper'

describe Course, type: :model do

  describe '#course_types' do
    it 'returns STI types' do
      result = Course.course_types
      expect(result).to eq(['FirstCourse', 'MainCourse', 'DrinkCourse'])
    end
  end

  describe 'validations' do
    let(:course) { create(:first_course) }

    it 'validates presence of name' do
      course.name = nil

      expect(course.invalid?).to be_truthy

      course.name = 'Soup'

      expect(course.valid?).to be_truthy
    end

    it 'validates presence of price' do
      course.price = nil

      expect(course.invalid?).to be_truthy

      course.price = 50.0

      expect(course.valid?).to be_truthy
    end

    it 'validates numericality of price' do
      course.price = 'soup'

      expect(course.invalid?).to be_truthy

      course.price = 50.0

      expect(course.valid?).to be_truthy
    end
  end

end

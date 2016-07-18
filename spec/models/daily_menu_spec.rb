require 'rails_helper'

describe DailyMenu, type: :model do
  let(:daily_menu) { create(:daily_menu) }

  it 'validates the uniqueness of date' do
    daily_menu

    expect(DailyMenu.count).to eq 1

    expect{DailyMenu.create!()}.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Date has already been taken')
  end

  it 'sets the date today before validation' do
    daily_menu = DailyMenu.new

    expect(daily_menu.date).to be_nil

    daily_menu.valid?

    expect(daily_menu.date).to eq(Time.zone.now.to_date)
  end
end

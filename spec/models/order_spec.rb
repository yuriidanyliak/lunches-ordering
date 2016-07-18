require 'rails_helper'

describe Order, type: :model do

  describe '#total_cost_for_today' do
    let!(:order) { create(:order) }

    it 'returns actual cost' do
      result = Order.total_cost_for_today
      expect(result).to eq(order.first_course.price + order.main_course.price + order.drink_course.price)
    end
  end

  describe 'scope #of_today' do
    let(:user) { create(:user) }
    let!(:order) { create(:order, user: user) }

    let(:another_user) { create(:user, email: 'another@user.com') }
    let!(:yesterdays_order) { create(:order, created_at: Time.zone.now - 1.day, user: another_user) }

    it 'returns only todays order' do
      expect(Order.of_today.count).to eq(1)
    end
  end

end

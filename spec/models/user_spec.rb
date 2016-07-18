require 'rails_helper'

describe User do
  describe 'user creation' do
    context 'when user is first registered user in system' do
      let(:user) { build(:user) }

      it 'becomes admin' do
        expect{user.save!}.to change{AdminUser.count}.from(0).to(1)
      end
    end

    context 'when every user is created' do
      let(:user) { build(:user, access_token: nil) }

      it 'gets his own access token saved' do
        user.save!
        user.reload

        expect(user.access_token).to be_present
      end
    end
  end

end

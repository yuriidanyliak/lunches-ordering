require 'rails_helper'

describe ApiOrdersController do

  describe 'GET index' do
    let(:user) { create(:user) }
    let(:another_user) { create(:user, email: 'another@user.com') }
    let(:order) { create(:order, user: another_user) }

    context 'access token is correct' do
      it 'renders template' do
        get :index, %{{ "access_token": "#{user.access_token}" }}, { format: :json }

        expect(response).to render_template(:index)
      end
    end

    context 'access token is missing/incorrect' do
      it 'returns :unathorized' do
        get :index, %{{ "access": "#{user.access_token}" }}, { format: :json }

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

end

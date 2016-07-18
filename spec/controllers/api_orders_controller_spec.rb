require 'rails_helper'

describe ApiOrdersController do

  describe 'GET index' do
    let(:user) { create(:user) }

    it 'renders template' do
      get :index, %{{ "access_token": "#{user.access_token}" }}, { format: :json }

      expect(response).to render_template(:index)
    end
  end

end

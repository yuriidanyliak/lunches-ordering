require 'rails_helper'

describe DailyMenusController do

  render_views

  describe 'GET show' do
    before do
      sign_in
    end

    let(:menu) { create(:daily_menu) }

    it 'renders template' do
      get :show, id: menu.id

      expect(response).to render_template(:show)
    end

    it 'finds the exact daily menu that was requested' do
      get :show, id: menu.id

      expect(assigns(:daily_menu).id).to eq(menu.id)
    end
  end

end

require 'rails_helper'

describe OrdersController do
  render_views

  before do
    sign_in
  end

  describe 'GET index' do
    it 'renders template' do
      get :index

      expect(response).to render_template(:index)
    end

    it 'returns orders' do
      get :index

      expect(assigns(:orders)).to eq(Order.all)
    end

    it 'detects the admin' do
      get :index, admin: 'true'

      expect(assigns(:admin)).to eq(true)
    end
  end

  describe 'GET new' do
    before do
      user = create(:user)
      allow(controller).to receive(:current_user) { user }
    end

    it 'renders template' do
      get :new

      expect(response).to render_template(:new)
    end

    it 'creates new instance if Order' do
      get :new

      expect(assigns(:order)).to be_new_record
    end
  end

  describe 'POST create' do
    let(:first_course) { create(:first_course) }
    let(:main_course) { create(:main_course) }
    let(:drink_course) { create(:drink_course) }
    let(:user) { create(:user) }

    it 'redirects to root path' do
      post :create, order: {
                      user_id: user.id,
                      first_course_id: first_course.id,
                      main_course_id: main_course.id,
                      drink_course_id: drink_course.id
                  }
      expect(response).to redirect_to(:root)
    end

    it 'creates new order' do
      expect do
        post :create, order: {
                        user_id: user.id,
                        first_course_id: first_course.id,
                        main_course_id: main_course.id,
                        drink_course_id: drink_course.id
                    }
      end.to change{Order.count}.from(0).to(1)
    end
  end

end

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'orders#index'
  resources :orders, only: [:new, :create, :index]
  get 'daily_menus/:id', to: 'daily_menus#show', as: 'daily_menus'

  scope '/api' do
    scope '/v1' do
      scope '/orders' do
        get '/' => 'api_orders#index'
      end
    end
  end
end

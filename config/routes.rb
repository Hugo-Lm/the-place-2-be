Rails.application.routes.draw do
  devise_for :users
  root to: 'spots/places#index'

  scope module: :spots do
    resources :places do
      resources :comments, only: [:create, :index, :destroy]
    end
    get '/maps', to: 'maps#index'
  end
end

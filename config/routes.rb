Rails.application.routes.draw do
  devise_for :users
  root to: 'spot/places#index'

  scope module: :spot do
    resources :places do
      resources :comments, only: [:create, :index, :destroy]
    end
  end
end

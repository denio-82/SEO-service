Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#request_form'

  resources :sites, only: [:index, :destroy] do
    collection do
      get :request_form
      get :analysis
    end
    
    resources :pages, only: :show, shallow: true
  end
end

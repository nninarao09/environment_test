Rails.application.routes.draw do
  resources :books
  root 'books#index'

  resources :books do
    member do
      get :delete
    end
  end
  

end
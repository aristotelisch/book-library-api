Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :authors do
    resources :books
  end

  resources :publishers do
    resources :books
  end

  resources :books
end

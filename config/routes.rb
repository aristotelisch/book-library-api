Rails.application.routes.draw do
  scope '/', defaults: { format: 'json' } do
    resources :authors do
      resources :books
    end

    resources :publishers do
      resources :books
    end

    resources :books
  end
end

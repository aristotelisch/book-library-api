Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

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

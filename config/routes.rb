Rails.application.routes.draw do
  devise_for :users, path: '',
                      path_names: {
                        sign_in: 'login',
                        sign_out: 'logout',
                        registration: 'signup'
                      },
                      controllers: {
                        sessions: 'sessions',
                        registrations: 'registrations'
                      }

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

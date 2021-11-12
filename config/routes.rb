Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :web do
    root to: "welcome#index"

    resource :session, only: %i[new create destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :claims
    end
  end
end

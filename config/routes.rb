Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :web do
    root to: "welcome#index"

    resource :session, only: %i[new create destroy]
    resources :orders, only: %i[create show]
    resources :claims
  end
end

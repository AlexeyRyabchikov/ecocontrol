Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :web do
    root to: "welcome#index"

    resource :session, only: %i[new create destroy]
    resources :orders, only: %i[index new create show] do
      get :search_companies, on: :collection
    end
    resources :claims
    resources :companies

    resources :forecasts, only: %i[index]
  end
end

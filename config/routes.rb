Rails.application.routes.draw do
  resources :csvimporters do
    collection { post :import }
  end

  root to: "csvimporters#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

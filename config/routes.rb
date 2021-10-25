Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'lists#index'
  resources :lists, only: [:index, :new] do # , :show, :create] do
    resources :bookmarks, only: [:index, :new, :create, :show]
  end
  resources :bookmarks, only: :destroy
  resources :movies, only: [:index, :show]
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  # Megan - `resources :offers` generates the 7 CRUD routes for the offers controller
  # I wrote them out manually below so you can see how that would be done ☺
  # resources :offers

  get    "offers",          to: "offers#index"

  get    "offers/new",      to: "offers#new",  as: :new_offer
  post   "offers",          to: "offers#create"

  # IMPORTANT: The `show` route needs to be *after* `new` route or else you will recieve a routing error
  # Honestly, I cannot remember why this is so, but it is lol
  get    "offers/:id",      to: "offers#show", as: :offer

  get    "offers/:id/edit", to: "offers#edit", as: :edit_offer
  patch  "offers/:id",      to: "offers#update"

  delete "offers/:id",      to: "offers#destroy"
end

WheresHome::Application.routes.draw do

  resources :applications, except: [:new]
  match 'applications/new/:property_id', to: 'applications#new'
  resources :jobs
  get 'properties/search', to: 'properties#search', as: :properties_search
  resources :properties
  resources :pictures
  resources :locations

  devise_for :sellers, controllers: {
    registrations: "sellers/registrations",
    sessions: 'sellers/sessions'
  }

  devise_for :buyers, controllers: {
    omniauth_callbacks: "buyers/omniauth_callbacks",
    registrations: "buyers/registrations"
  }, skip: [
    :registrations,
    :sessions
  ]

  devise_scope :buyer do
    delete 'buyers/sign_out', to: 'devise/sessions#destroy', as: :destroy_buyer_session
    get 'buyers/edit', to: 'buyers/registrations#edit', as: :edit_buyer_registration
    put 'buyers', to: 'buyers/registrations#update', as: :buyer_registration
  end

  root to: "static_pages#index"
  match 'about', to: "static_pages#about", as: :static_pages_about
  match 'contact', to: "static_pages#contact", as: :static_pages_contact
  match 'landing', to: "static_pages#landing", as: :static_pages_landing
  match 'landlord', to: "static_pages#landlord", as: :static_pages_landlord

end

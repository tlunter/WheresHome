WheresHome::Application.routes.draw do
  resources :jobs
  resources :properties
  resources :pictures
  resources :locations

  devise_for :sellers, controllers: {
    registrations: "sellers/registrations"
  }

  devise_for :buyers, controllers: {
    omniauth_callbacks: "buyers/omniauth_callbacks"
  }, skip: [
    :registrations,
    :sessions
  ]

  devise_scope :buyer do
    delete 'buyers/sign_out', to: 'devise/sessions#destroy', as: :destroy_buyer_session
    get 'buyers/edit', to: 'devise/registrations#edit', as: :edit_buyer_registration
    put 'buyers', to: 'devise/registrations#update', as: :buyer_registration
  end

  root to: 'static_pages#index'
end

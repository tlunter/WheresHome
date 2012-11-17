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
    delete 'buyers/sign_out', to: 'buyers/sessions#destroy', as: :destroy_buyers_session
    get 'buyers/edit', to: 'buyers/registrations#edit', as: :edit_buyers_registration
    put 'buyers', to: 'buyers/registrations#update', as: :buyers_registration
  end

  root to: 'static_pages#index'
end

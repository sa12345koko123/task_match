Rails.application.routes.draw do


  devise_for :companies, controllers: {
      sessions: 'companies/sessions',
      registrations: 'companies/registrations'
    }


  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations'
  }

  devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations'
    }

    namespace :admins do
      get "/" => "homes#top"
      resources :users, only:[:index, :show, :update]
      resources :companies, only:[:index, :create]
    end

    namespace :companies do
      resources :companies, only:[:show, :edit, :update] do
        resources :jobs
      end
    end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

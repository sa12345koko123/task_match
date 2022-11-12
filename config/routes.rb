Rails.application.routes.draw do


  namespace :companies do
    devise_for :companies, controllers: {
      sessions: 'companies/sessions',
      registrations: 'companies/registrations'
    }

    resources :companies, only:[:show, :edit, :update] do
      resources :jobs
    end
  end




  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations'
    }


  namespace :admins do
    devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations'
    }

    get "admins" => "homes#top"
    resources :users, only:[:index, :show, :update]
    resources :companies, only:[:index]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

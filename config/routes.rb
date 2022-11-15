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

  scope module: :public do
    root to: "homes#top"
    get '/about' => "homes#about", as: "about"
    # get 'users/my_page' => 'users#show'
    resources :users, only:[:show, :update, :edit] do
      resources :orders, only:[:index, :show, :new, :create, :destroy]
      # get 'orders/confirm/' => 'orders#confirm'
      # get 'orders/complete' => 'orders#complete'

    end
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdrawal' => 'users#withdrawal'
    resources :companies, only:[:index, :show]
    resources :jobs, only:[:index, :show] do
      resources :comments, only: [:create, :destroy]
    end

  end



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

Rails.application.routes.draw do


  namespace :companies do
    devise_for :companies, controllers: {
      sessions: 'companies/sessions',
      registrations: 'companies/registrations'
    }


    resources :companies, only:[:show, :edit, :update] do
      resources :blogs, only:[:new, :index, :create, :show, :destroy]
      resources :jobs
    end
      resources :tags do
        get 'jobs', to: 'jobs#search_tag'
    end
  end

  post 'companies/companies/guest_sign_in', to: 'companies/companies#guest_sign_in'




  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: "homes#top"
    get '/about' => "homes#about", as: "about"
    # get 'users/my_page' => 'users#show'
    resources :users, only:[:show, :update, :edit] do
      resources :orders, only:[:index, :show, :new, :create, :destroy]
      # get 'orders/confirm/' => 'orders#confirm'
      # get 'orders/complete' => 'orders#complete'
    end
    get 'users/:id/unsubscribe' => 'users#unsubscribe'
    patch 'users/:id/withdrawal' => 'users#withdrawal'
    resources :companies, only:[:index, :show]
    get "news/data"
    resources :tags do
        get 'jobs', to: 'jobs#search_tag'
    end
    resources :jobs, only:[:index, :show] do
      resources :comments, only: [:create, :destroy]
    end

  end



  namespace :admins do
    devise_for :admins,skip:[:registrations,:passwords],controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations'
    }

    get "admins" => "homes#top"
    patch 'users/:id/withdrawal' => 'users#withdrawal'
    resources :users, only:[:index, :show, :update]
    resources :companies, only:[:index, :show]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do


   root to: "homes#top"
  get "/about" => "homes#about" , as: "about"


  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  devise_for :users,skip: [ :passwords] , controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
 patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

 devise_scope :user do
     post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
   end

  namespace :admin do
    get 'homes/top' => "homes#top", as: "top"
    resources :cafes, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :cafe_posts, only: [:show] do
        resources :comments, only: [:destroy]
    end
  end

  resources :users, only: [:show, :edit, :update]

  resources :cafes, only: [:new, :create, :index, :show, :edit, :update]

  resources :cafe_posts do
     resources :likes, only: [:create, :destroy]
     resources :comments, only: [:create]
    end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

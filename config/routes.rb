Rails.application.routes.draw do


   root to: "homes#top"
  get "/about" => "homes#about" , as: "about"

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  resources :cafe_posts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

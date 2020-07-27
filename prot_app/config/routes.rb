Rails.application.routes.draw do

  get 'login' => "users#login_form"
  post 'login' => "users#login"
  post 'logout' => "users#logout"

  get 'users/create_subject' => "users#create_subject"
  get 'users/main_subject' => "users#main_subject"
  get 'users/atend_subject' => "users#atend_subject"
  get 'users/keyword_subject' => "users#keyword_subject"

  get 'users/index' => "users#index"
  get 'users/:id' => "users#show"
  get 'signup' => "users#new"
  post 'users/create' => "users#create"
  get 'users/:id/edit' => "users#edit"
  post 'users/:id/update' => "users#update"


  get 'posts/index' => "posts#index"
  get 'posts/new' => "posts#new"
  post 'posts/create' => "posts#create"
  get 'posts/:id' => "posts#show"
  get 'posts/:id/edit' => "posts#edit"
  post 'posts/:id/update' => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"


  get 'courses/index' => "courses#index"
  #get 'courses/:id' => "courses#main"   この順番だとnewを呼び出すときにこのurlがよびだされる
  get 'courses/new' => "courses#new"
  post 'courses/create' => "courses#create"
  get 'courses/:id' => "courses#main"
  get 'courses/:id/edit_member' => "courses#edit_member"
  get 'courses/:id/add_user_to_group' => "courses#add_user_to_group"
  
  get 'courses/:id/show_member' => "courses#show_member"
  get 'courses/:id/edit_keyword' => "courses#edit_keyword"
  post 'courses/:id/update_keyword' => "courses#update_keyword"
  get 'courses/:id/destroy' => "courses#destroy"
  #post 'courses/:id/add_user_to_group' => "courses#add_user_to_group"
  #resources  :posts
  
  get '/' => "home#top"
  get 'about' => "home#about"
  



end


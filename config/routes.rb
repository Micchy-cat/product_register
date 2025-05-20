Rails.application.routes.draw do
  # コメントアウトしたら↓、いつものYay! You're on Rails!画面に行く
  # root 'products#index'
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

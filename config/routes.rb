Rails.application.routes.draw do
  root 'home#top'

  get 'top' => 'home#top'
  get 'first' => 'home#first'
  get 'news' => 'home#news'
  get 'info' => 'home#info'
  get 'calender' => 'home#calender'
  get 'map' => 'home#map'
  get 'search' => 'home#search'

  get 'articles' => 'articles#top'
  get 'articles/index' => 'articles#index'
  get 'articles/first' => 'articles#first'
  get 'articles/news' => 'articles#news'
  get 'articles/info' => 'articles#info'
  get 'articles/calender' => 'articles#calender'
  get 'articles/map' => 'articles#map'
  get 'articles/search' => 'articles#search'

  get 'la' => 'la#top'
  get 'la/top' => 'la#top'
  get 'la/first' => 'la#first'
  get 'la/news' => 'la#news'
  get 'la/info' => 'la#info'
  get 'la/calender' => 'la#calender'
  get 'la/map' => 'la#map'
  get 'la/search' => 'la#search'

  get 'others' => 'others#top'
  get 'others/top'
  #get 'others/first'
  #get 'others/news'
  get 'others/info'
  #get 'others/calender'
  get 'others/map'
  #get 'others/search'
  get 'others/contact'
  get 'others/privacy-policy' => 'others#privacy_policy'
  get 'others/disclaimer'

  devise_for :users
  resources :articles
  resources :las
  # get 'help' => 'welcome#help'
  # post 'articles/:id' => 'articles#show'
  post 'articles/attach', to: 'articles#attach'
  as :user do
    get 'wusers/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'wusers' => 'devise/registrations#update', :as => 'user_registration'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

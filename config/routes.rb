Rails.application.routes.draw do

  root 'home#home'

  get 'search' => 'search#search'
  post 'search' => 'search#results'

end

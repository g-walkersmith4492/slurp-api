# frozen_string_literal: true

Rails.application.routes.draw do
  resources :reviews
  # RESTful routes
  resources :examples, except: %i[new edit]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  post '/yelp-search' => 'reviews#yelp_search'
  post '/yelp-search-specs' => 'reviews#yelp_search_specs'
    post '/yelp-search-price' => 'reviews#yelp_search_price'
end

Rails.application.routes.draw do

  resources :zipcodes, only: [:index]
  
  resources :ziptocbsamappings do
  collection {post :upload}
  end
  
  resources :cbsatomsamappings do
  collection {post :upload}
  end
  
  root to: 'zipcodes#index'
end

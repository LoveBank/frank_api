Rails.application.routes.draw do

  jsonapi_resources :entries
  jsonapi_resources :actions
  jsonapi_resources :comments
  jsonapi_resources :profiles
  jsonapi_resources :families
  jsonapi_resources :moods
  jsonapi_resources :love_bank

  jsonapi_resources :profiles do
    jsonapi_relationships
  end

end

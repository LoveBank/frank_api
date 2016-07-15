Rails.application.routes.draw do

  jsonapi_resources :entries
  # jsonapi_resources :frank_actions
  # jsonapi_resources :frank_comment
  jsonapi_resources :profiles
  jsonapi_resources :insights
  # jsonapi_resources :frank_families
  # jsonapi_resources :frank_moods
  # jsonapi_resources :frank_love_bank

end

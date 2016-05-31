Rails.application.routes.draw do

  jsonapi_resources :frank_entries
  # jsonapi_resources :frank_actions
  # jsonapi_resources :frank_comment
  jsonapi_resources :frank_profiles
  # jsonapi_resources :frank_families
  # jsonapi_resources :frank_moods
  # jsonapi_resources :frank_love_bank

  jsonapi_resources :frank_profiles do
    jsonapi_relationships
  end

  jsonapi_resources :posts

end

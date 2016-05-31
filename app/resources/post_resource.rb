class PostResource < JSONAPI::Resource
  model_name 'Frank::Post'
  attributes :title, :body
  has_one :frank_profile
end

class CommentResource < JSONAPI::Resource
  model_name 'Frank::Comment'
  attribute :mood
  attribute :body

  has_one :profile
  has_one :entry
end

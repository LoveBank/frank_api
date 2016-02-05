class CommentResource < JSONAPI::Resource
  attribute :mood
  attribute :body

  has_one :profile
  has_one :entry
end

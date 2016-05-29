class FrankCommentResource < JSONAPI::Resource
  model_name 'Frank::Comment'
  attribute :mood
  attribute :body

  has_one :frank_profile
  has_one :frank_entry
end

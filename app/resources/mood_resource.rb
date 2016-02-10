class MoodResource < JSONAPI::Resource
  model_name 'Frank::Mood'
  attributes :rating, :note

  has_one :profile
end

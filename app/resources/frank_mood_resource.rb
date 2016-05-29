class FrankMoodResource < JSONAPI::Resource
  model_name 'Frank::Mood'
  attributes :rating, :note

  has_one :frank_profile
end

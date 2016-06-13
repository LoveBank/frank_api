class MoodResource < JSONAPI::Resource
  attributes :rating, :note

  has_one :profile
end

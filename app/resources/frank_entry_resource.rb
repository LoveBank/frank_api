class FrankEntryResource < JSONAPI::Resource
  model_name 'Frank::Entry'
  attributes :received, :note, :rating, :private, :linked_profile_id, :occurred_on

  has_one :frank_profile
  has_many :frank_comments
end

class EntryResource < JSONAPI::Resource
  model_name 'Frank::Entry'
  attributes :received, :note, :rating, :private, :linked_profile_id, :occurred_on

  has_one :profile
  has_many :comments
end

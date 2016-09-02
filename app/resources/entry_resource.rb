class EntryResource < JSONAPI::Resource
  attributes :received, :note, :rating, :private, :linked_profile_id, :occurred_on

  has_one :profile
  has_many :comments

  def self.default_sort
    [{field: 'occurred_on', direction: :desc}]
  end
end

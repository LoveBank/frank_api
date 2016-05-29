class FrankFamilyResource < JSONAPI::Resource
  model_name 'Frank::Family'
  attributes :name
  relationship :frank_profiles, to: :many

  # key_type :uuid
end

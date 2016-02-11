class FamilyResource < JSONAPI::Resource
  model_name 'Frank::Family'
  attributes :name
  relationship :profiles, to: :many

  # key_type :uuid
end

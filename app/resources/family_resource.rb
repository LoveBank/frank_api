class FamilyResource < JSONAPI::Resource
  attributes :name
  relationship :profiles, to: :many

  # key_type :uuid
end

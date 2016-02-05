class LoveBankResource < JSONAPI::Resource
  attributes :note, :rating

  has_one :profile
end

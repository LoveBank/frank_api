class LoveBankResource < JSONAPI::Resource
  model_name 'Frank::LoveBank'
  attributes :note, :rating

  has_one :profile
end

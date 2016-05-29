class FrankLoveBankResource < JSONAPI::Resource
  model_name 'Frank::LoveBank'
  attributes :note, :rating

  has_one :frank_profile
end

class FrankActionResource < JSONAPI::Resource
  model_name 'Frank::Action'
  immutable
  attributes :name, :language, :help

  filters :name, :language
end

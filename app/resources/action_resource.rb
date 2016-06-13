class ActionResource < JSONAPI::Resource
  immutable
  attributes :name, :language, :help

  filters :name, :language
end

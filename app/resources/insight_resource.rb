class InsightResource < JSONAPI::Resource
  attributes :title, :body, :love_language, :category
  has_one :profile
end

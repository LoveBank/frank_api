class InsightResource < JSONAPI::Resource
  model_name 'Frank::Insight'
  attributes :title, :body, :love_language, :category
end

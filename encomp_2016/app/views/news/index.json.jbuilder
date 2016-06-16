json.array!(@news) do |news|
  json.extract! news, :id, :name, :body
  json.url news_url(news, format: :json)
end

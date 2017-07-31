json.array! @scrapes do |scrape|
  json.url scrape.url
  json.content do
    json.array! Tag::TAG_TYPES.keys do |key|
      json.tag key
      json.values scrape.tags.send(key).pluck(:value)
    end
  end
end

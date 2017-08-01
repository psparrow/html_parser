class Tag < ApplicationRecord
  belongs_to :scrape

  TAG_TYPES = {
    'a' => 'href',
    'h1' => nil,
    'h2' => nil,
    'h3' => nil,
  }

  TAG_TYPES.keys.each do |tag|
    scope tag, -> { where(tag_type: tag) }
  end
end

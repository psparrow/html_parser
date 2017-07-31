class Scrape < ApplicationRecord
  has_many :tags
  validates :url, presence: true, url_or_local_file: true

  def process
    Parser.new(self).process
  end
end

class Scrape < ApplicationRecord
  has_many :tags
  validates :url, presence: true, url_or_local_file: true

  def process
    PageScraper.new(self).process
  end
end

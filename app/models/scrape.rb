class Scrape < ApplicationRecord
  paginates_per 10

  CACHE_LENGTH = 1.hour

  has_many :tags
  validates :url, presence: true, url_or_local_file: true

  delegate :process, to: :page_scraper
  def page_scraper
    @page_scraper ||= PageScraper.new(self)
  end

  def cached?
    scraped_at && scraped_at > CACHE_LENGTH.ago
  end
end

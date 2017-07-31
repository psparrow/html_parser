class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(id)
    scrape = Scrape.find(id)
    scrape.process
  end
end

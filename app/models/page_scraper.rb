require 'nokogiri'
require 'open-uri'

class PageScraper
  attr_reader :scrape, :tag_types, :document

  def initialize(scrape, tag_types = Tag::TAG_TYPES)
    @scrape = scrape
    @tag_types = tag_types
  end

  def process
    update_timestamp
    clear_tags
    process_tag_types
    true
  rescue Errno::ENOENT => e # URL not openable
    false
  end

  private

  def update_timestamp
    scrape.update_attribute(:scraped_at, Time.current)
  end

  def clear_tags
    scrape.tags.destroy_all
  end

  def process_tag_types
    tag_types.each do |tag_type, attr|
      process_tag_type(tag_type, attr)
    end
  end

  def process_tag_type(tag_type, attr)
    document.css(tag_type).each do |element|
      value =
        if attr
          next unless element.attributes[attr.to_s]
          element.attributes[attr.to_s]
        else
          element.content
        end

      add_tag(tag_type, value)
    end
  end

  def document
    @document ||= Nokogiri::HTML(open(scrape.url))
  end


  def add_tag(tag_type, value)
    scrape.tags << Tag.new(tag_type: tag_type, value: value)
  end
end

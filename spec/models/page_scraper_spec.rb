require 'rails_helper'

describe PageScraper do
  describe '#process' do
    subject { described_class.new(scrape) }
    let(:scrape) { create :scrape }

    before do
      subject.process
      scrape.reload
    end

    it 'stores the content of H1 tags' do
      expect(scrape.tags.h1.map(&:value)).to include 'Header 1'
    end

    it 'stores the content of H2 tags' do
      expect(scrape.tags.h2.map(&:value)).to include 'Header 2'
    end

    it 'stores the content of H3 tags' do
      expect(scrape.tags.h3.map(&:value)).to include 'Header 3 with link'
    end

    it 'stores the href of links' do
      expect(scrape.tags.a.map(&:value)).to include 'http://google.com'
    end
  end
end

require 'rails_helper'

describe 'POST /api/v1/scrapes' do
  let(:payload) {
    { url: url }
  }

  context 'with URL' do
    let(:url) { 'http://www.google.com' }

    before do
      expect(ScrapeJob).to receive(:perform_later)
      post_json(api_v1_scrapes_url, payload)
    end

    it 'creates a Scrape for the URL' do
      expect(Scrape.last.url).to eq payload[:url]
    end

    it 'is successful' do
      expect(response.status).to eq 200
    end
  end

  context 'with invalid URL' do
    let(:url) { nil }

    before do
      expect(ScrapeJob).not_to receive(:perform_later)
      post_json(api_v1_scrapes_url, payload)
    end

    it 'does not create a Scrape' do
      expect(Scrape.last).to be_nil
    end

    it 'fails' do
      expect(response.status).to eq 422
    end
  end
end

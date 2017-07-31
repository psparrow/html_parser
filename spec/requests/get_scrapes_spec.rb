require 'rails_helper'

describe 'GET /api/v1/scrapes' do
  let!(:scrape) { create :scrape, :with_tags }

  let(:expected) {
    [
      { 'url' => scrape.url,
        'content' => [
          {
            'tag' => 'a',
            'values' => scrape.tags.a.pluck(:value)
          },
          {
            'tag' => 'h1',
            'values' => scrape.tags.h1.pluck(:value)
          },
          {
            'tag' => 'h2',
            'values' => scrape.tags.h2.pluck(:value)
          },
          {
            'tag' => 'h3',
            'values' => scrape.tags.h3.pluck(:value)
          }
        ]
      }
    ]
  }

  before do
    get api_v1_scrapes_url
  end

  it 'is successful' do
    expect(response.status).to eq 200
  end

  it 'returns a list of scraped URLs' do
    expect(JSON.parse(response.body)).to eq(expected)
  end
end

require 'rails_helper'

describe ScrapeJob do
  let(:scrape) { instance_double(Scrape, process: true) }

  before do
    allow(Scrape).to receive(:find).and_return(scrape)
  end

  it 'processes the scrape' do
    expect(scrape).to receive(:process)
    ScrapeJob.perform_now(1)
  end
end

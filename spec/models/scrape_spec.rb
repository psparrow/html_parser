require 'rails_helper'

describe Scrape do
  context 'valid URLs' do
    it { is_expected.to allow_value('http://google.com').for(:url) }
    it { is_expected.to allow_value('http://www.google.com').for(:url) }
    it { is_expected.to allow_value(sample_page_url).for(:url) }
  end

  context 'invalid URLs' do
    it { is_expected.not_to allow_value('htt://www.google.com').for(:url) }
    it { is_expected.not_to allow_value('google.com').for(:url) }
    it { is_expected.not_to allow_value(Rails.root.join('non-existent').to_s).for(:url) }
  end
end

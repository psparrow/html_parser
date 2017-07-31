FactoryGirl.define do
  factory :scrape do
    url { sample_page_url }

    trait :with_tags do
      after(:create) do |scrape|
        scrape.tags << build(:tag, tag_type: 'h1', value: 'Foo')
        scrape.tags << build(:tag, tag_type: 'h1', value: 'Bar')
        scrape.tags << build(:tag, tag_type: 'h2', value: 'Baz')
        scrape.tags << build(:tag, tag_type: 'h3', value: 'Bik')
        scrape.tags << build(:tag, tag_type: 'a', value: 'http://google.com')
        scrape.tags << build(:tag, tag_type: 'a', value: 'http://yahoo.com')
      end
    end
  end
end

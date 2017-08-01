class AddScrapedAtToScrapes < ActiveRecord::Migration[5.1]
  def change
    add_column :scrapes, :scraped_at, :datetime
  end
end

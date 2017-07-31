class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.references :scrape, foreign_key: true
      t.string :tag_type
      t.text :value

      t.timestamps
    end
  end
end

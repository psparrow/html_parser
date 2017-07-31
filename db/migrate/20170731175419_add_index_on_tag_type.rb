class AddIndexOnTagType < ActiveRecord::Migration[5.1]
  def change
    add_index(:tags, :tag_type)
  end
end

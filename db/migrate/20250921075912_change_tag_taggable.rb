class ChangeTagTaggable < ActiveRecord::Migration[8.0]
  def change
    rename_column :tags, :taggable_id, :tagable_id
    rename_column :tags, :taggable_type, :tagable_type
    rename_index :tags, 'index_tags_on_taggable_type_and_taggable_id', 'index_tags_on_tagable_type_and_tagable_id'
  end
end

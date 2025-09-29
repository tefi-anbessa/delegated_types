class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.string :label, null: false
      t.string :service, null: false
      t.string :taggable_type
      t.bigint :taggable_id

      t.timestamps
    end
    add_index :tags, :label, unique: true
    add_index :tags, [:taggable_type, :taggable_id]

  end
end

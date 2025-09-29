class CreateCables < ActiveRecord::Migration[7.2]
  def change
    create_table :cables do |t|
      t.decimal :length
      t.references :cable_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end

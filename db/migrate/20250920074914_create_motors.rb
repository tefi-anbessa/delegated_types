class CreateMotors < ActiveRecord::Migration[7.2]
  def change
    create_table :motors do |t|
      t.decimal :power

      t.timestamps
    end
  end
end

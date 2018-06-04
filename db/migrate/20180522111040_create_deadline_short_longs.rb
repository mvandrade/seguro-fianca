class CreateDeadlineShortLongs < ActiveRecord::Migration[5.1]
  def change
    create_table :deadline_short_longs do |t|
      t.integer :code
      t.string :description, limit: 50
      t.integer :status
      t.date :date_status

      t.timestamps
    end
  end
end

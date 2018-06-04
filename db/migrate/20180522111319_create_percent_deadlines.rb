class CreatePercentDeadlines < ActiveRecord::Migration[5.1]
  def change
    create_table :percent_deadlines do |t|
      t.integer :quantity_days
      t.decimal :percentage_aplided, precision: 7, scale: 4
      t.references :deadline_short_long, foreign_key: true

      t.timestamps
    end
  end
end

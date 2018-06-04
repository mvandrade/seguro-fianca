class AddDeadlineShortLongIdToTax < ActiveRecord::Migration[5.1]
  def change
    add_reference :taxes, :deadline_short_long, foreign_key: true
  end
end

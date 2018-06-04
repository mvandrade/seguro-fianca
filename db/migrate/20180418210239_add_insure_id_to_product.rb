class AddInsureIdToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :insurer, foreign_key: true
  end
end

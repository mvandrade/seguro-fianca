class CreateCompositionProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :composition_products do |t|
      t.references :product, foreign_key: true
      t.references :cover, foreign_key: true

      t.timestamps
    end
  end
end

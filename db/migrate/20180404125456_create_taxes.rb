class CreateTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :taxes do |t|
      t.date :validity
      t.decimal :rate, precision: 7, scale: 4
      t.references :branch, foreign_key: true

      t.timestamps
    end
  end
end

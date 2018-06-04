class CreateInformationProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :information_products do |t|
      t.date :validity
      t.decimal :minimum_plot_value, precision: 17, scale: 2
      t.decimal :minimum_policy_value, precision: 17, scale: 2
      t.decimal :discount_limit, precision: 7, scale: 4
      t.decimal :commission_limit, precision: 7, scale: 4
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end

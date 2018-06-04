class CreateInformationCoverages < ActiveRecord::Migration[5.1]
  def change
    create_table :information_coverages do |t|
      t.date :validity
      t.date :final_term
      t.integer :multiplier_importance_value
      t.decimal :minimum_importance_value, precision: 17, scale: 2      
      t.decimal :maximum_importance_value, precision: 17, scale: 2
      t.decimal :minimum_reference, precision: 7, scale: 4
      t.decimal :maximum_reference, precision: 7, scale: 4
      t.decimal :minimum_premium_reference, precision: 17, scale: 2
      t.boolean :compulsory_coverage
      t.integer :type_coverage
      t.integer :type_use
      t.decimal :rate_pure, precision: 7, scale: 4
      t.decimal :fixed_value, precision: 17, scale: 2
      t.string :description_franchise, limit: 100
      t.integer :status
      t.date :date_status
      t.references :composition_product, foreign_key: true

      t.timestamps
    end
  end
end

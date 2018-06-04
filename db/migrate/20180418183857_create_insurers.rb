class CreateInsurers < ActiveRecord::Migration[5.1]
  def change
    create_table :insurers do |t|
      t.integer :code
      t.string :name, limit: 50
      t.string :contact_name, limit: 50
      t.integer :contact_phone

      t.timestamps
    end
  end
end

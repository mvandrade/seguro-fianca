class CreateCovers < ActiveRecord::Migration[5.1]
  def change
    create_table :covers do |t|
      t.integer :code
      t.string :name, limit: 50
      t.text :description, limit: 255
      t.references :branch, foreign_key: true

      t.timestamps
    end
  end
end

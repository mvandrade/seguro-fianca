class CreateBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :branches do |t|
      t.integer :code
      t.string :name, limit: 50
      t.text :description, limit: 255
      t.references :group_branch, foreign_key: true

      t.timestamps
    end
  end
end

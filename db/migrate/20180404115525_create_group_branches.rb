class CreateGroupBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :group_branches do |t|
      t.integer :code
      t.string :description, limit: 50

      t.timestamps
    end
  end
end

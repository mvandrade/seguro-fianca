class AddNameToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :name, :string, limit: 50
  end
end

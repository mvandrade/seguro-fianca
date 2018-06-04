class AddNameToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :name, :string, limit: 50  
  end
end

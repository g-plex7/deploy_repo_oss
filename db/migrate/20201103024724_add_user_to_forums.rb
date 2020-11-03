class AddUserToForums < ActiveRecord::Migration[6.0]
  def change 
    add_column :forums, :user_id, :integer
  end
end

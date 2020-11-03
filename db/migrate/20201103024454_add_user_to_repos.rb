class AddUserToRepos < ActiveRecord::Migration[6.0]
  def change
   add_column :repos, :user_id, :integer
  end
end

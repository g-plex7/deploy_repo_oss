class AddPublicRepoToRepos < ActiveRecord::Migration[6.0]
  def change
    add_column :repos, :public_repo, :string 
  end
end

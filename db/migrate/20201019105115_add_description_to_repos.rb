class AddDescriptionToRepos < ActiveRecord::Migration[6.0]
  def change
    add_column :repos, :desc, :text
  end
end

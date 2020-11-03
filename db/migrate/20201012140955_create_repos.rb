class CreateRepos < ActiveRecord::Migration[6.0]
  def change
    create_table :repos, id: false do |t|
      t.binary :id, limit: 36, primary_key: true, :null => false
      
      t.string :judul
      t.string :repo_information

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.binary :id, limit: 36, primary_key: true, :null => false

      t.string :name
      t.string :provider
      t.text :uid
      t.string :oauth_token
      t.string :public_repo
      t.string :image

      t.timestamps
    end
  end
end

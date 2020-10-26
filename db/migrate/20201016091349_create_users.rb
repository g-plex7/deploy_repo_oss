class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.binary :id, limit: 36, primary_key: true, :null => false

      t.string :email
      t.string :password_digest
      t.attachment :avatar

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end

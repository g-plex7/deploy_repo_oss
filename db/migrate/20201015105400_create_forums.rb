class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums, id: false do |t|
      t.binary :id, limit: 36, primary_key: true, :null => false

      t.string :title
      t.text :question
      t.attachment :images

      t.timestamps
    end
  end
end

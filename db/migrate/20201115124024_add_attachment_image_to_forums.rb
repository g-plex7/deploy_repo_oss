class AddAttachmentImageToForums < ActiveRecord::Migration[6.0]
  def self.up
    change_table :forums do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :forums, :image
  end
end

class Forum < ApplicationRecord
    # uuid 
    before_create :set_uuid 
    def set_uuid
        self.id = SecureRandom.uuid  
    end 

    # acts_as_taggable_on
    acts_as_taggable_on :tags

    # image upload  
    has_attached_file :image, style: { medium: "300x300>", thumb: "100x100" }, default_url: "image/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    # database connection
end

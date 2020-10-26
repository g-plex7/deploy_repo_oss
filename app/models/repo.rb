class Repo < ApplicationRecord
    validates :link, presence: true
    validates :judul, presence: true

    before_create :set_uuid 
    def set_uuid
        self.id = SecureRandom.uuid 
    end 

    before_save do
        self.repo_information.gsub!(/[\[\]\"]/, "")&.delete.prefix(", ") if attribute_present?("repo_information") 
    end 

    # database migration 
    belongs_to :user, optional: true 
end

class User < ApplicationRecord
    # uuid tools 
    before_create :set_uuid  
    def set_uuid
        self.id = SecureRandom.uuid   
    end 

    # auth with github
    def self.from_omniauth(auth)
        user = find_by(uid: auth['uid'])
        return user if user.present? 
        create! do |user|
            user.provider = auth['provider']
            user.uid = auth['uid']
            user.name = auth['info']['nickname']
            user.oauth_token = auth['credentials']['token'] 
        end 
    end

    # database relation 
    has_many :repos
    has_many :forums
end

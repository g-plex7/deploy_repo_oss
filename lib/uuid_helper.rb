module UuidHelper 
    def self.include(base)
        base.primary_key = 'id'
        base.before_create :assign_id
    end

    private 

    def assign_id
        self.uuid = UUIDTools::UUID.timstamps_create().to_s.upcase if id_changed?
    end 
end 
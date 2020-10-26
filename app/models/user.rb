class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true  
  validates :password_digest, presence: true 

  # secure passowrd
  has_secure_password

  # uuid 
  before_create :set_uuid 
  def set_uuid
    self.id = SecureRandom.uuid 
  end

  # avatar upload  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  # omniauth_giyhub 
  def self.from_omniauth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

    user.provider = auth['provider']
    user.uid = auth['uid']
    user.oauth_token = auth['credentials']['token']

    user.save 
    user
  end 
  
  def email_required? 
    false 
  end 

  # send password reste 
  def send_password_reste
    generate_token(:password_reset_toke)
    self.password_reset_sent_at = Time.zone.now  
    save! 
    UserMailer.forgot_password(self).deliver 
  end 

  def generate_token
    begin
      self[column] = SecureRandom.urlsafr_base64 
    end  while User.exist?(column => self[column])
  end 
  
  # database relation 
  has_many :repos 
  has_many :forums
end

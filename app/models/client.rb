require 'digest/sha2'

class Client < ActiveRecord::Base
  has_many :stations
  
  validates :userid, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  validates :email_address, :presence => true
  validates :contact_name, :presence => true
  
  
  
  attr_accessor :password_confirmation
  attr_reader  :password 
  
  validate   :password_must_be_present
  
  def Client.authenticate(userid, password)
    if client = find_by_userid(userid)
	  #puts "FOUND userid object for userid"
	  #puts userid
	  
	  if client.password_hash == encrypt_password(password, client.password_salt)
	    client
	  end
	end
  end
  
  def Client.encrypt_password(password, salt)
    #puts "password_hash shown on next line"
    #puts Digest::SHA2.hexdigest(password + "armstrong" + salt)
    Digest::SHA2.hexdigest(password + "armstrong" + salt)
  end
  
  # Virtual attribute, not persisted
  def password=(password)
    @password = password
	
	if password.present?
      #puts "Assigned password, now generating salt"
	  generate_password_salt
	  self.password_hash = self.class.encrypt_password(password, password_salt)
	end
  end
  
  
  private
  
    def password_must_be_present
      errors.add(:password, "is missing") unless password_hash.present?
    end
  
    def generate_password_salt
      self.password_salt = self.object_id.to_s + rand.to_s
	  #puts "Generated salt, shown on next line"
	  #puts self.password_salt
    end
    
end

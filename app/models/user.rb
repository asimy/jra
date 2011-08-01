class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :first_name, :last_name, :presence => true , 
                                     :length => {:maximum => 25}
  validates :email, :presence => true,
                    :format => {:with=> email_regex},
                    :uniqueness => {:case_sensitive => false}
                    
  validates :password, :confirmation => true,
                       :presence => true,
                       :length => { :within => 6..40 }
                       
  before_save :encrypt_password
  
  private
    def encrypt_password
      self.encrypted_password = encrypt(password)
    end
  
    def encrypt(string)
      string
    end
end


# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#


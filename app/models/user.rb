class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  has_many :responses, :through => :client
  has_many :clients, :class_name => "Client", :foreign_key => "reference_id"
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def full_name
    if middle_name.nil
      name
    elsif middle_name.size == 1
      "#{first_name} #{middle_name}. #{last_name}"
    else
      "#{first_name} #{middle_name} #{last_name}"
    end
  end
  
end

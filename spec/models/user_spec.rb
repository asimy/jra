require 'spec_helper'

describe User do
  before(:each) do
    @attr = {:first_name => "Example", 
             :last_name => 'User', 
             :email => 'anotheruser@example.com',
             :password => 'alskvNJ83-',
             :password_confirmation => 'alskvNJ83-'}
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a last_name" do
    no_last_name_user = User.new(@attr.merge(:last_name => ''))
    no_last_name_user.should_not be_valid
  end
  
  it "should require a first_name" do
    no_first_name_user = User.new(@attr.merge(:first_name => ''))
    no_first_name_user.should_not be_valid
  end
  
  it "should require an email" do
    no_email_user = User.new(@attr.merge(:email => ''))
    no_email_user.should_not be_valid
  end
  
  it "should reject first names that are too long" do
    long_name = "a"*26
    long_name_user = User.new(@attr.merge(:first_name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should reject last names that are too long" do
    long_name = "a"*26
    long_name_user = User.new(@attr.merge(:last_name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    good_addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    good_addresses.each do |address|
      good_email_user = User.new(@attr.merge(:email => address))
      good_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    bad_addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    bad_addresses.each do |address|
      bad_email_user = User.new(@attr.merge(:email => address))
      bad_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    User.create(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "password validations" do
    it "should require a password" do
      User.new(@attr.merge(:password =>'', :password_confirmation => '')).
        should_not be_valid
    end
    
    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => 'notthesame')).
        should_not be_valid
    end
    
    it "should reject short passwords" do
      short_password = "a"*5
      hash = @attr.merge(:password => short_password, :password_confirmation => short_password)
      User.new(hash).should_not be_valid
    end
    
    it "should reject long passwords" do
      long_password = "b"*41
      hash = @attr.merge(:password => long_password, :password_confirmation => long_password)
      User.new(hash).should_not be_valid
    end
  end
  
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
    
    describe "has_password? method" do
      it "should be true if passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end
      
      it "should be false if the passwords don't match" do
        @user.has_password?("bad password").should be_false
      end
    end
    describe "authenticate method" do
      it "should return nil on email/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
        wrong_password_user.should be_nil
      end
      
      it "should return nil for an email address with no user" do
        nonexistent_user = User.authenticate("fu@sna.com", @attr[:password])
        nonexistent_user.should be_nil
      end
      
      it "should return the user on an email/password match" do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user
      end
    end
  end
end



# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#


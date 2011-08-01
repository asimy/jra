require 'spec_helper'

describe User do
  before(:each) do
    @attr = {:first_name => "Example", :last_name => 'User', :email => 'user@example.com'}
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


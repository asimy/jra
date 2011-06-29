class Group < ActiveRecord::Base
  has_many :users, :class_name => "user"
end

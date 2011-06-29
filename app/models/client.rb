class Client < ActiveRecord::Base
  has_many :response_sets
  belongs_to :user
end

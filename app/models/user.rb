class User < ActiveRecord::Base
  has_one :account
  has_many :orders

  has_and_belongs_to_many :tasks
end

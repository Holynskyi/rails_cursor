class Account < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: {minimum: 8}
  validates :name,format: {with: /\A(?=.*[a-z])[a-z\d]+\Z/i}
  validates :age, presence: true, numericality: {greater_than_or_equal_to: 18, less_than_or_equal_to: 100}
end

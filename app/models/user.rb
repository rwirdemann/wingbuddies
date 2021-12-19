class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  has_and_belongs_to_many :sessions
  has_many :friendships
  has_many :friends, :through => :friendships
end

class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true
  
  has_many :portfolios
  has_many :holdings, :through => :portfolios
end

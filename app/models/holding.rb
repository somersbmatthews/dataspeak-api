class Holding < ApplicationRecord
	belongs_to :portfolio
	has_many :holdings
end

class Product < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	validates :price, numericality: {
		greter_than_or_equal_to: 0.0
	} 
end
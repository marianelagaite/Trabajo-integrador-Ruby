class Bill < ActiveRecord::Base
	belongs_to :client
	belongs_to :purchaser

	validates :amount, numericality: {greater_than_or_equal_to: 0}, presence: true
	validates :client, :purchaser, :description, :date, presence: true  

	accepts_nested_attributes_for :purchaser
end

class Purchaser < ActiveRecord::Base
	belongs_to :person
	has_many :bills, inverse_of: :purchaser

	accepts_nested_attributes_for :person

	validates :person, presence: true
	validates :cuil_cuit, {presence: true,
								uniqueness: true,
								length: { is: 11}}

	def nameSurname
		self.person.nameSurname
	end
end

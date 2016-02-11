class Person < ActiveRecord::Base
	has_one :client, inverse_of: :person 
	has_one :purchaser, inverse_of: :person

	validates :name, presence: true
	validates :type_person, presence: true
	
	has_many :contacts

	before_save :default_values

	def default_values
		self.trash ||= 0
	end

	def toTrash
		self.update(trash: 1)
	end

	def restore
		self.update(trash: 0)
	end

	def self.deleted
		Person.where(trash: 1)
	end

	def self.notDeleted
		Person.where(trash: 0)
	end

	def nameSurname
		nameSurname = "#{self.name}" + (self.surname.nil? ? "" : " #{self.surname}")
	end
end

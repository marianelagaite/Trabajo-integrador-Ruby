class Person < ActiveRecord::Base
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
end

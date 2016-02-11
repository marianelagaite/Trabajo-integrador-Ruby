class Client < ActiveRecord::Base
	validates :dni, length: { is: 8}, allow_nil: true
	validates :cuil_cuit, {presence: true,
							uniqueness: true,
							length: { is: 11}}
	validates :person, presence: true						
	belongs_to :person
	has_many :bills, inverse_of: :client 
	has_many :contacts, dependent: :destroy
	accepts_nested_attributes_for :person
	accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true 
	
	def totalBills
		self.bills.count
	end
	
	def purchasersWithMoreBills
		Purchaser.where(id: Bill.where("client_id = ?", self.id).
								group("purchaser_id").
								order("count(*) desc").
								limit(5).
								count.
								keys)
	end

	#change strftime if you don't use SQlite
	def amountPerYear
		Bill.where("client_id = ?", self.id).
			group("strftime('%Y', date)").
			order("strftime('%Y', date) desc").
			pluck("SUM(amount), strftime('%Y', date)")
	end

	def numberOfBillsPerMonth
		con = ActiveRecord::Base.connection
		cli_id = con.quote(self.id)
		qry = "SELECT count(*), strftime('%m', date) as month
									FROM bills
									WHERE strftime('%Y', date) = strftime('%Y', 'now')
									AND client_id = #{cli_id}
									GROUP BY month
									"
		con.execute(qry)
	end	

	def toTrash
		self.person.toTrash
	end

	def restore
		self.person.restore
	end

	def self.deleted
		Client.joins(:person).where(people:{trash: 1})
	end

	def self.notDeleted
		Client.joins(:person).where(people:{trash: 0})
	end
	def age
		today = Date.today
		age = today.year - self.birthday.year - (((today.month > self.birthday.month) || (today.month == self.birthday.month && today.day >= self.birthday.day)) ? 0 : 1)
	end

	def nameSurname
		self.person.nameSurname
	end
end

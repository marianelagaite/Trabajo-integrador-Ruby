FactoryGirl.define do
	factory :person do
		name "pepe"
		surname "botella"
		type_person 1
		trash 0
	end

	factory :client do
		birthday "1985-04-26"
		dni 43557123
		gender 1
		sequence(:cuil_cuit) {|n| n + 11111111111}
		association :person

		factory :client_with_contact do
			after(:create) do |client|
				create(:contact, client: client)
			end
		end
	end

	factory :contact do
		type_contact "Telefono"
		data_contact "4798568"
		association :client
	end

	factory :purchaser do
		sequence(:cuil_cuit) {|n| n + 55555555555}
		association :person
	end

	factory :bill do
		association :purchaser
		association :client
		amount 6564.23
		description "100 helicopteros 
					1 casa
					1kg azúcar"
		date "2016-1-25"
	end

end
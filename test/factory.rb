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
		sequence(:cuil_cuit) {|n| 11111111111}
		person
	end

	factory :contact do
		type_contact "Telefono"
		data_contact "4798568"
		client
	end
end
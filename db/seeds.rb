# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create({"name"=> "Patricio", "surname"=>"Estrella", "type_person"=>1, "trash"=>0})
Person.create({"name"=> "Doug", "surname"=>"Narinas", "type_person"=>1, "trash"=>0})
Person.create({"name"=> "Pedro", "surname"=>"Picapiedra", "type_person"=>2, "trash"=>0})
Person.create({"name"=> "Juan", "surname"=>"Perez", "type_person"=>1, "trash"=>1})
Person.create({"name"=> "Ailin", "surname"=>"Rey", "type_person"=>2, "trash"=>0})
Person.create({"name"=> "Denise", "surname"=>"Palumbo", "type_person"=>1, "trash"=>0})
Person.create({"name"=> "Micaela", "surname"=>"Ane", "type_person"=>2, "trash"=>0})
Person.create({"name"=> "Un", "surname"=>"Señor", "type_person"=>1, "trash"=>0})
Person.create({"name"=> "Agus", "surname"=>"Beynet", "type_person"=>2, "trash"=>1})
Person.create({"name"=> "Marian", "surname"=>"Gaite", "type_person"=>1, "trash"=>0})
Person.create({"name"=> "Pablo", "surname"=>"Pepe", "type_person"=>2, "trash"=>0})
Person.create({"name"=> "Hermenigilda", "surname"=>"Punchan", "type_person"=>1, "trash"=>0})

Client.create({"person_id"=>1, "birthday"=>"1972-12-01", "cuil_cuit"=>23600657410, "gender"=>2, "dni"=>56403659})
Client.create({"person_id"=>2, "birthday"=>"2000-05-12", "cuil_cuit"=>23698656548, "gender"=>2, "dni"=>23403659})
Client.create({"person_id"=>3, "birthday"=>"1960-03-30", "cuil_cuit"=>21198657455, "gender"=>2, "dni"=>43445659})
Client.create({"person_id"=>4, "birthday"=>"1999-08-03", "cuil_cuit"=>23698343410, "gender"=>1, "dni"=>43403659})

Purchaser.create({"person_id"=>5, "cuil_cuit"=>58965340703})
Purchaser.create({"person_id"=>6, "cuil_cuit"=>78565340703})
Purchaser.create({"person_id"=>7, "cuil_cuit"=>78955340703})
Purchaser.create({"person_id"=>9, "cuil_cuit"=>78965140703})
Purchaser.create({"person_id"=>8, "cuil_cuit"=>78965342703})
Purchaser.create({"person_id"=>10, "cuil_cuit"=>78985340723})
Purchaser.create({"person_id"=>11, "cuil_cuit"=>73965340703})
Purchaser.create({"person_id"=>12, "cuil_cuit"=>78965342703})

Contact.create("client_id"=>1, "type_contact"=>"Telefono", "data_contact"=>"56589520")
Contact.create("client_id"=>1, "type_contact"=>"Email", "data_contact"=>"56580952")
Contact.create("client_id"=>2, "type_contact"=>"Telefono", "data_contact"=>"59658952")
Contact.create("client_id"=>3, "type_contact"=>"Telefono", "data_contact"=>"55488952")
Contact.create("client_id"=>3, "type_contact"=>"Correo", "data_contact"=>"56258952")

Bill.create({"client_id"=>1, "purchaser_id"=>2, "amount"=> 2324.45, "description"=>"1 Heladera, 1kg Dulce de leche", "date"=>"2016-1-23"})
Bill.create({"client_id"=>1, "purchaser_id"=>2, "amount"=> 23224.45, "description"=>"1 exorsismo, ojotas de playa", "date"=>"2016-2-22"})
Bill.create({"client_id"=>1, "purchaser_id"=>1, "amount"=> 2324.35, "description"=>"cebolla, morron, lechuga", "date"=>"2015-2-22"})
Bill.create({"client_id"=>2, "purchaser_id"=>2, "amount"=> 23324.45, "description"=>"1 Helicoptero", "date"=>"2015-4-12"})
Bill.create({"client_id"=>2, "purchaser_id"=>1, "amount"=> 2324.95, "description"=>"2 colchones 1/2 plaza", "date"=>"2014-6-12"})
Bill.create({"client_id"=>3, "purchaser_id"=>4, "amount"=> 23254.45, "description"=>"1 ventilador de techo", "date"=>"2016-1-44"})
Bill.create({"client_id"=>4, "purchaser_id"=>12, "amount"=> 92324.45, "description"=>"100 autos", "date"=>"2016-5-32"})
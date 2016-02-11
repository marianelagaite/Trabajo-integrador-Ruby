require 'test_helper'
require 'factory_girl'
class ClientTest < ActiveSupport::TestCase
	test "save client with contact" do
		cli = create(:client)
		assert cli.save 
	end

	test "client with brong param" do
		client = Client.new(cuil_cuit: 235)
		assert_not client.save
	end

	test "delete client without bills" do
		cli = create(:client)
		assert cli.save
		assert_empty cli.bills
		assert cli.delete
	end
end

require 'test_helper'

class BillTest < ActiveSupport::TestCase
  test "good bill" do
    bi = create(:bill)
    assert bi.save
  end

  test "bad bill" do
  	bi = Bill.new() #empty
  	assert_not bi.save
  end
end
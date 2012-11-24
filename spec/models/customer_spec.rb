require 'spec_helper'
require 'factory_girl'

describe Customer do
 #start -- added by asma
  describe "Testing factories" do
	before (:each )do
		@aliya = FactoryGirl.create(:customer) 
		@asma = FactoryGirl.create(:customer, :firstName => "Asma", :lastName => "Al-kubaisi", 
		:phone => "97444988831", :email => "asma@asma.com", :address => "PO BOX 128765")
	end
	it "created the factory object correctly" do
		@aliya.should be_valid
		@asma.should be_valid
	
	end	
	it "should return the names in alphabetical order" do  # This doesn't work yet as the create method saves attributes as nil
		Customer.alphabetical.map{|o| o.firstName}.should == ["Aliya", "Asma"]
	end
  end
	it "should return the proper name as first_name last_name" do # This doesn't work yet as the create method saves attributes as nil
		@asma.proper_name.should == "Asma Al-kubaisi"
	end
  #end -- added by asma
 

end

require 'spec_helper'
require 'factory_girl'

describe CustomerCupcake do
  #start -- added by asma
  describe "Testing factories" do
	before (:each )do
		@aliya = FactoryGirl.create(:customer) 
		@asma = FactoryGirl.create(:customer, :firstName => "Asma", :lastName => "Al-kubaisi", 
		:phone => "97444988831", :email => "asma@asma.com", :address => "PO BOX 128765")
		@choco = FactoryGirl.create(:customer_cupcake, :name => "Chocolate Cup Cake",
		:flavor => "Chocolate", :icing => "Chocolate", :customer_id => @aliya)  
		@vanillaRainbow = FactoryGirl.create(:customer_cupcake, :customer_id => @asma)
	end
	
	it "should create the factory object correctly" do # This doesn't work yet as the create method saves attributes as nil
		@choco.should be_valid
		@vanillaRainbow.should be_valid
		@choco.name.should == "Chocolate Cup Cake"
		@choco.flavor.should == "Chocolate"
		@choco.icing.should == "Chocolate"
		@choco.customer_id.should == @aliya.id #check this 
	end	
	
	it "should return the names in alphabetical order" do  # This doesn't work yet as the create method saves attributes as nil
		CustomerCupcake.alphabetical.map{|o| o.name}.should == ["Aliya", "Chocolate Cup Cake"]
	end
  end
  it "should find all cupcakes for a given customer" do  # This doesn't work yet as the create method saves attributes as nil
	CustomerCupcake.for_user(1).alphabetical.map{|o| o.name}.should == ["Aliya"]
  end
  #Asma: "latest(receives number)" validation is not added as we don't have a date attribute to begin with
  #end -- added by asma
  
  
end

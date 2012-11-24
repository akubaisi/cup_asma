class Customer < ActiveRecord::Base
attr_accessor :firstName, :lastName, :address, :email, :phone
validates :firstName, :presence => true
validates :lastName, :presence => true
validates :phone, :presence => true
validates :email, :presence => true
validates_format_of :phone, :with => /^(\+?\{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits"
#validates_format_of :email, :with => /^[\w]([^@\s,:]+)@(([\w_]+\.)(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid email adress"
before_save :formate_phone

scope :alphabetical, order('lastName, firstName')


private

def formate_phone
	phone = self.phone.to_s
	#to avoid having nil phone field
	phone.gsub!(/[^0-9]/, "")
	#\ refers to regular expression
	self.phone = phone
end

#begin -- added by asma
def proper_name
	firstName + " " + lastName
end
#end -- added by asma

end

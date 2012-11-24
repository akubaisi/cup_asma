class CustomerCupcake < ActiveRecord::Base
attr_accessor :name, :size, :flavor, :icing, :additional_topping, :customer_id
validates :name, :presence => true
validates :customer_id, :presence => true

belongs_to :customer

validates_inclusion_of :flavor, :in => %[Red Velvet, Chocolate, Vanilla, Strawberry, Pistachio], :message => "is not an option", :allow_nil => true, :allow_blank => true
FLAVORS = [ ['RedVelvet', 'Red Velvet'], ['Chocolate', 'Chocolate'], ['Vanilla', 'Vanilla'], ['Strawberry', 'Strawberry'], ['Pistachio', 'Pistachio'] ]

validates_inclusion_of :icing, :in => %[Cream Cheese, Chocolate, Vanilla, Strawberry, Pistachio], :message => "is not an option", :allow_nil => true, :allow_blank => true
ICINGS = [ ['creamcheese', 'Cream Cheese'], ['Chocolate', 'Chocolate'], ['Vanilla', 'Vanilla'], ['Strawberry', 'Strawberry'], ['Pistachio', 'Pistachio'] ]

scope :alphabetical, order('name')
scope :for_user, lambda{|customer_id| where('id = ?', customer_id)}

#Asma: The below method should not be added as we have no date attribute, the below is taken from the visit model
# scope :latest, lambda{|num| limit(num).order('visit_date DESC')}  

end

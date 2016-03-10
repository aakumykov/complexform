class Address < ActiveRecord::Base

	belongs_to :person
	
	validates :street, presence: true
	validates :person_id, numericality: { only_integer: true }, if: Proc.new { |a|
		
		puts "===== a.person =====> #{a.person} (#{a.person.class})"
		#puts "===== a.person.name =====> #{a.person.name}"
		#!a.person.nil?
		false
	}
	
	accepts_nested_attributes_for :person, reject_if: proc { false }
	#validates_associated :person, if: Proc.new { false }
end
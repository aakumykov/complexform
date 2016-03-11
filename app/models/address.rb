class Address < ActiveRecord::Base

	belongs_to :person
	
	validates :street, presence: true
	validates :person_id, numericality: { only_integer: true }, if: Proc.new { |a|
		
		puts "===== a.person.nil? =====> #{a.person.nil?}"
		puts "===== a.person =====> #{a.person}"
		puts "===== a.person.id.nil? =====> #{a.person.id.nil?}"
		puts "===== a.person.id =====> #{a.person.id}"
		
		puts "===== a.person_id.nil? =====> #{a.person_id.nil?}"
		puts "===== a.person_id =====> #{a.person_id}"
		
		puts "===== a.person.new_name.nil? =====> #{a.person_id.nil?}"
		puts "===== a.person.new_name =====> #{a.person_id}"

		true
	}
	
	accepts_nested_attributes_for :person
	#validates_associated :person, if: Proc.new { false }
end
class Address < ActiveRecord::Base

	belongs_to :person
	
	validates :street, presence: true
	#validates :person_id, numericality: { only_integer: true }#, if: "person.name.blank?"
	
	accepts_nested_attributes_for :person, allow_destroy: false#, reject_if: lambda {|attributes| attributes[:name].blank? }
	validates_associated :person, unless: Proc.new { |a| 
		puts "===== validates_associated, a =====> #{a}, #{a.person}" 
		a.attributes.each do |k,v|
			puts "#{k} => #{v}"
		end
		a.person.attributes.each do |k,v|
			puts "#{k} => #{v}"
		end
	}
end

class Address < ActiveRecord::Base

	belongs_to :person
	attr_accessor :new_person_name
	
	validates :street, presence: true
	validates :person_id, numericality: { only_integer: true }, unless: Proc.new { |a|
		puts "===== a.new_person_name =====> #{a.new_person_name}"
		puts "===== a.new_person_name.blank? =====> #{a.new_person_name.blank?}"
		a.person.nil?
	}
	validates :new_person_name, length:{minimum:2,maximum:12}, unless: Proc.new { |a|
		a.new_person_name.blank?
	}
	
	#accepts_nested_attributes_for :person, reject_if: proc { |a|
	#	a.new_name.blank?
	#}
	#validates_associated :person, if: Proc.new { false }
end
class Address < ActiveRecord::Base

	belongs_to :person
	attr_accessor :new_person_name
	
	validates :street, presence: true
	validates :person_id, numericality: { only_integer: true }, if: Proc.new { |a|
		a.new_person_name.blank?
	}
	validates :new_person_name, length:{minimum:2,maximum:12}, if: Proc.new { |a|
		a.person_id.blank?
	}
	
	#validates_associated :person, if: Proc.new { false }
end
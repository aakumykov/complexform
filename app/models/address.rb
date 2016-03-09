class Address < ActiveRecord::Base
	belongs_to :person
	accepts_nested_attributes_for :person, allow_destroy: false#, reject_if: lambda {|attributes| attributes[:name].blank? }
	validates_associated :person#, if: "person_id.blank?"
	
	validates :street, presence: true
	validates :person_id, numericality: { only_integer: true }#, if: "name.blank?"
end

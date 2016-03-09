class Address < ActiveRecord::Base
	belongs_to :person
	accepts_nested_attributes_for :person, allow_destroy: true
	validates_associated :person

	validates :street, presence: true
	#validates :person_id, presence: true
end

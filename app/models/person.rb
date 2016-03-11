class Person < ActiveRecord::Base
	has_many :addresses

	validates :name, presence: true, if: "new_name.nil?"
	
	attr_accessor :new_name
	validates :new_name, length: {minimum:2, maximum:10}, unless: "new_name.nil?"
end

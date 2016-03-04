class Address < ActiveRecord::Base
	belongs_to :person

	validates :street, presence: true
end

class Address < ActiveRecord::Base
	belongs_to :person

	validates :kind, presence: true

	validates :street, presence: true
end

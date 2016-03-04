class Person < ActiveRecord::Base
	has_many :addresses
	accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: lambda {|attributes| (attributes[:kind].blank? || attributes[:street].blank?) }
end

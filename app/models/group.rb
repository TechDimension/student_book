class Group < ActiveRecord::Base
	has_many :students, dependent: :destroy
end

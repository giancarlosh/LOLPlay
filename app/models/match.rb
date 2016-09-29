class Match < ApplicationRecord
	# belongs_to :user1_id, :class_name => 'User'
	# belongs_to :user2_id, :class_name => 'User'
	belongs_to :tournament
	has_many :users
end

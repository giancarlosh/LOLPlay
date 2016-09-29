class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_one :score, dependent: :destroy
	# has_many :matches_won, :class_name => 'Match', :foreign_key => 'winner_id'
	# has_many :matches_lost, :class_name => 'Match', :foreign_key => 'loser_id'
	validates :name, presence: true, uniqueness: true 
	has_many :matches


	def self.update_score(idwinner,idloser)
		winner_user = User.find_by(id: idwinner)
		count_result(winner_user,1)

		loser_user = User.find_by(id: idloser)
		count_result(loser_user,0)
	end

	def count_result(user,i)
		if (i==1)
			user.score.wins += 1
			user.score.points +=3
		else
			user.score.losses += 1 
		end
		user.score.win_ratio = user.score.wins/(user.score.wins+user.score.losses)
		user.save
	end




end

class Tournament < ApplicationRecord
	has_many :matches, dependent: :destroy

	def self.create_tournaments(rol)
		players = User.where(rol: "#{rol}")
		amount_players = players.count

		tournament = Tournament.create(size: total_matches(amount_players))
		size = tournament.size
		groups = select_players(rol)
		for i in 0..size-1
			user1 = groups[i][0]
			user1_name = User.where(id: user1).first.name
			user2 = groups[i][1]
			user2_name = User.where(id: user2).first.name
			Match.create(name: "1VS1", user1_id: user1, user1: user1_name,
				user2_id: user2, user2: user2_name, tournament_id: tournament.id, 
				date: DateTime.now + (rand * 14))
			user1 = User.where(id: user1)
			user2 = User.where(id: user2)
			update_matches(user1)
			update_matches(user2)
		end 
	end

	def self.select_players(rol)
		players_id = User.where(rol: "#{rol}").pluck(:id)
		groups = RoundRobinTournament.schedule(players_id) 
		return  groups.reduce(:concat)
	end

	def self.update_matches(user)
		
		user.first.matches_ += 1
		user.first.save
	end
	
	def self.total_matches (players)
		factorial(players)/(2*factorial(players-2))
	end 

	def self.factorial (n)
		if (n == 0)
			return  1
		else
			return n*(factorial(n-1))
		end
	end


end

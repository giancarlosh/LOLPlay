require 'rails_helper'

RSpec.describe Tournament, type: :model do
	before(:each) do

		@user1 = User.create(name: "giakos", email: "prueba@outlook.com", password: "123456", gender: "Male", rol: "Top", summoner_id: 41878626)
		@user2 = User.create(name: "carlos", email: "prueba2@outlook.com", password: "123456", gender: "Male", rol: "Top", summoner_id: 41878627)
		@user3 = User.create(name: "Javi", email: "prueba3@outlook.com", password: "123456", gender: "Male", rol: "Top", summoner_id: 41878625)
		@user4 = User.create(name: "Rocio", email: "prueba4@outlook.com", password: "123456", gender: "Male", rol: "Top", summoner_id: 41878625)
		
	end

	describe "check_if_create_matches" do
		it "when Tournament size is 4" do
			Tournament.create_tournaments("Top")
			expect(Match.count).to eq(6)
		end

		it "when two users have a match" do
			Tournament.create_tournaments("Top")
			expect(User.first.matches_).to eq(3)
		end

		it "relation between Tournament and Matches" do
			Tournament.create_tournaments("Top")
			expect(Tournament.first.matches.count).to eq(6)
		end

	end
end

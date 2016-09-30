require 'rails_helper'

RSpec.describe User, type: :model do
	before(:each) do
		@user1 = User.create(name: "giakos", email: "prueba@outlook.com", password: "123456", gender: "Male", rol: "Top", summoner_id: 41878626)
		@user1.score = Score.create(wins: 0,losses: 0, win_ratio: 0.0, points: 0)
		@user2 = User.create(name: "jamonhacendado", email: "prueba2@outlook.com", password: "123456", gender: "Male", rol: "Top", summoner_id: 41878627)
		@user2.score = Score.create(wins: 0,losses: 0, win_ratio: 0.0, points: 0)
	end
	describe "check_if_score_update" do
		it "when user1 win the match" do
			User.update_score(@user1.id, @user2.id)
			expect(Score.first.wins).to eq(1)
		end

		it "when user2 win the match" do
			User.update_score(@user2.id, @user1.id)
			expect(Score.last.wins).to eq(1)
		end
	end
end

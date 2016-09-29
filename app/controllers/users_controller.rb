class UsersController < ApplicationController
	
	skip_before_action :authenticate_user!, only: [:index]
	def index
		@user =current_user
		if @user!=nil
			@rol = @user.rol
			if @user.score == nil
				@user.score = Score.create(wins: 0,losses: 0, win_ratio: 0.0, points: 0)
				if User.where(rol: "#{@rol}").count ==12
					Tournament.create_tournaments(@rol)
					opponents = Match.where("user1_id = #{@user.id}").or(Match.where("user2_id = #{@user.id}"))
					@op = opponents.pluck(:user1, :user2, :date)
				end
			end
		end
	end

	def show
		@user = current_user
		@rol = @user.rol	
	end

	def calendar
		@user = current_user
		@rol = @user.rol
		opponents = Match.where("user1_id = #{@user.id}").or(Match.where("user2_id = #{@user.id}"))
		@op = opponents.pluck(:user1, :user2, :date)
	end
	def profile
		
	end

end

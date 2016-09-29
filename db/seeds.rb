# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
summoner_id_def = 40000000
rols = ["Top", "Mid", "Jungle", "Adc", "Supp"]
genders = ["Male", "Female"]
for i in 1..58
	user = User.create(
        name: FFaker::Name.first_name,
        rol: rols[i%5],
        gender: genders[i%2],
        email: FFaker::Internet.email,
        password: "123123",
        password_confirmation: "123123",
        summoner_id: summoner_id_def+i
      )
	user.score = Score.create(wins: 0,losses: 0, win_ratio: 0.0, points: 0)
end

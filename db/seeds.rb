Movie.destroy_all
User.destroy_all


user = User.create(email: "andre@lewagon.pt", password: "123456")

5.times do
  movie = Movie.new(title: Faker::Movies::StarWars.character,rating:rand(1..10), user:user)
  movie.save
end

require_relative('./models/movie.rb')
require_relative('./models/casting.rb')
require_relative('./models/performer.rb')

Performer.delete_all

movie1 = Movie.new('title' => 'The Matrix', 'genre' => 'Sci-Fi')
# movie1.save
movie2 = Movie.new('title' => 'Bill & Ted\'s Excellent Adventure', 'genre' => 'Comedy')
# movie2.save
movie3 = Movie.new('title' => 'John Wick', 'genre' => 'Action')
# movie3.save
movie4 = Movie.new('title' => 'Fight Club', 'genre' => 'Psychological Thriller')
# movie4.save

performer1 = Performer.new('first_name' => 'Keanu', 'last_name' => 'Reeves')
# performer1.save
performer2 = Performer.new('first_name' => 'Laurence', 'last_name' => 'Fishburne')
# performer2.save
performer3 = Performer.new('first_name' => 'Edward', 'last_name' => 'Norton')
# performer3.save

casting1 =  Casting.new('fee' => 3000, 'movie_id' => 1, 'performer_id' => 1)
# casting1.save

casting2 =  Casting.new('fee' => 1000, 'movie_id' => 2, 'performer_id' => 1)
# casting2.save

casting3 =  Casting.new('fee' => 5000, 'movie_id' => 3, 'performer_id' => 1)
# casting3.save

casting4 =  Casting.new('fee' => 3000, 'movie_id' => 1, 'performer_id' => 2)
# casting4.save

casting5 =  Casting.new('fee' => 3000, 'movie_id' => 4, 'performer_id' => 3)
# casting5.save

#
# p Movie.all
# p Performer.all
# movie3.title = 'Moby Dick'
# # movie3.save
# movie3.update

# performer3.last_name = "Norton Antivirus"
# performer3.update

# casting3.fee = 6000
# casting3.update

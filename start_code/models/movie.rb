require_relative('./casting.rb')
require_relative('./performer.rb')
require_relative('../db/sql_runner.rb')

class Movie

attr_accessor :title, :genre
attr_reader :id

def initialize(options)
  @title = options['title']
  @genre = options['genre']
  @id = options['id'].to_i if options['id']
end

def save
  sql = 'INSERT INTO movies (title, genre)
        VALUES ($1, $2)
        RETURNING id'
  values = [@title, @genre]
  @id = SqlRunner.run(sql,values).first['id'].to_i
end

def self.all
  sql = 'SELECT * FROM movies'
  movie_hashes = SqlRunner.run(sql)
  movies = movie_hashes.map {|hash| Movie.new(hash)}
  return movies
end

def update
  sql = 'UPDATE movies SET (title, genre) = ($1, $2) WHERE id = ($3)'
  values = [@title, @genre, @id]
  SqlRunner.run(sql, values)
end

end

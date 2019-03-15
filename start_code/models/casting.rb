require_relative('./movie.rb')
require_relative('./performer.rb')
require_relative('../db/sql_runner.rb')

class Casting

attr_reader :movie_id, :performer_id
attr_accessor :fee

def initialize(options)
  @fee = options['fee'].to_i if options['fee']
  @movie_id = options['movie_id'].to_i
  @performer_id = options['performer_id'].to_i
end

def save
  sql = 'INSERT INTO castings (fee, movie_id, performer_id)
        VALUES ($1, $2, $3)
        RETURNING id'
  values = [@fee, @movie_id, @performer_id]
  @id = SqlRunner.run(sql,values).first['id'].to_i
end

def self.all
  sql = 'SELECT * FROM castings'
  casting_hashes = SqlRunner.run(sql)
  castings = casting_hashes.map {|hash| Casting.new(hash)}
  return castings
end

def update
  sql = 'UPDATE castings SET fee = $1 WHERE id = ($2)'
  values = [@fee, @id]
  SqlRunner.run(sql, values)
end

end

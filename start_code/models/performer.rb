require_relative('./movie.rb')
require_relative('./casting.rb')
require_relative('../db/sql_runner.rb')

class Performer

attr_accessor :first_name, :last_name
attr_reader :id

def initialize(options)
  @first_name = options['first_name']
  @last_name = options['last_name']
  @id = options['id'].to_i if options['id']
end

def save
  sql = 'INSERT INTO performers (first_name, last_name)
        VALUES ($1, $2)
        RETURNING id'
  values = [@first_name, @last_name]
  @id = SqlRunner.run(sql,values).first['id'].to_i
end

def self.all
  sql = 'SELECT * FROM performers'
  performer_hashes = SqlRunner.run(sql)
  performers = performer_hashes.map {|hash| Performer.new(hash)}
  return performers
end

def update
  sql = 'UPDATE performers SET (first_name, last_name) = ($1, $2) WHERE id = ($3)'
  values = [@first_name, @last_name, @id]
  SqlRunner.run(sql, values)
end

def self.delete_all
  sql = 'DELETE FROM performers'
  SqlRunner.run(sql)
end

end

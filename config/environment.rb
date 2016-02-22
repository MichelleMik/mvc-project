require 'sqlite3'
require 'pry'
DB = {:conn => SQLite3::Database.new("restaurants.db")}

require_relative '../models/concerns/databaseable.rb'
require_relative '../models/restaurant.rb'
require_relative '../models/cuisine-type.rb'
require_relative '../views/cuisine-types/new.rb'
require_relative '../views/restaurants/new.rb'
require_relative '../controllers/cuisine-type-controller.rb'
require_relative '../controllers/restaurant_controller.rb'


 DB[:conn].execute("DROP TABLE IF EXISTS restaurants")
 DB[:conn].execute("DROP TABLE IF EXISTS cuisinetypes")


create_restaurants = <<-SQL  
CREATE TABLE IF NOT EXISTS restaurants (
  id INTEGER PRIMARY KEY,
  name TEXT,
  rating INTEGER,
  location TEXT,
  cuisinetype_id INTEGER 
  )
  SQL

  DB[:conn].execute(create_restaurants)
  DB[:conn].results_as_hash = true

  create_cuisinetypes = <<-SQL
  CREATE TABLE IF NOT EXISTS cuisinetypes (
    id INTEGER PRIMARY KEY,
    name TEXT
    )
  SQL
  DB[:conn].execute(create_cuisinetypes)
  DB[:conn].results_as_hash = true

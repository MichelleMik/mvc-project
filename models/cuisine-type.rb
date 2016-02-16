require 'pry'
class CuisineType
  attr_accessor :name
  attr_reader :restaurants # do we need writer too?
  
  @@cuisine_types = []

  def initialize(type_of_cuisine)
    @name = type_of_cuisine
    @restaurants = []
    @@cuisine_types << self
  end

  def add_restaurant(restaurant)
    @restaurants << restaurant
    restaurant.cuisine_type = self
  end

  def self.all
    @@cuisine_types
  end

  def self.find_by_name(cuisine_type)
    @@cuisine_types.find {|cuisine| cuisine.name == cuisine_type}
  end

end



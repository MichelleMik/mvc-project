class Restaurant
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods
  attr_accessor :name, :cuisine_type
  #attr_reader  :rating
  
  @@restaurants = []

  def initialize(name,cuisine_type)
    @name = name
    @@restaurants << self
    self.cuisine_type = cuisine_type
    cuisine_type.add_restaurant(self)
    #need cuisine type id using sql to link the two tables
   
  end

  def self.all
    @@restaurants
  end

  def rating=(rating)
    @rating = rating
  end

  def rating
    @rating
  end
def location=(location)
    @location = location
  end

  def location
    @location
  end

  # def cuisine_type=(cuisine_type)
  #   @cuisine_type = cuisine_type
  # end

  def self.find_by_name(restaurant_name)
    @@restaurants.find {|restaurant| restaurant.name == restaurant_name}
  end

end


# Practice Tests
# restaurant = Restaurant.new('Dennys')
# breakfast = CuisineType.new('Breakfast')
# restaurant.location = 'New York'
# restaurant.rating = 1
# restaurant.cuisine_type = breakfast
# puts breakfast.restaurants
# puts restaurant.location
# puts restaurant.rating
# puts restaurant.name
# puts restaurant.cuisine_type
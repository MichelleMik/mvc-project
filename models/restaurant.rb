class Restaurant
  attr_accessor :name, :location, :rating
  attr_reader :cuisine_type
  
  @@restaurants = []

  def initialize(restaurant)
    @name = restaurant
    @@restaurants << self
  end

  def self.all
    @@restaurants
  end

  def cuisine_type=(cuisine_type)
    @cuisine_type = cuisine_type
  end

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
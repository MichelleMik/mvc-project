require_relative '../config/environment.rb'
require_relative 'seed.rb'


def reload!
    load('../config/environment.rb')
end

action = 0
  while action != 'exit'
      puts 'what is the action you would like to take'
      action = gets.chomp
      
      case action
      when 'create'
          
          controller = RestaurantsController.new
          restaurant_name = controller.show_me_the_restaurants
          controller = RestaurantsController.new
          controller.create(restaurant_name)
      when 'show'
          puts 'what is the name of the restaurant you would like to see'
          restaurant_name = gets.chomp
          restaurant = Restaurant.find_by_name(restaurant_name)
          puts "Restaurant: #{restaurant.name}"
      end
end

Pry.start


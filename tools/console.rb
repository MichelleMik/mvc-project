require_relative '../config/environment.rb'
require_relative 'seed.rb'


def reload!
    load('../config/environment.rb')
end

action = 0
  while action != 'exit'
      puts 'what is the action you would like to take'
      menu = "create\n show\n list restaurants\nlist by cuisine"
      puts menu
      action = gets.chomp
      case action
      when 'create'
        controller = CuisineTypeController.new
        cuisine_type = controller.show_me_the_form
        controller = CuisineTypeController.new
         cuisine = controller.create(cuisine_type)
        controller = RestaurantsController.new
        restaurant_name = controller.show_me_the_form
        controller = RestaurantsController.new
        controller.create(restaurant_name,cuisine)

      when 'show'
        controller = RestaurantsController.new
        restaurant_name = controller.show_me_the_restaurant_request
        controller = RestaurantsController.new
        controller.show(restaurant_name)

      when 'list restaurants'
         restaurants = Restaurant.all
         if restaurants == [] 
             puts 'You have not created any restaurants [idiot]'
         else
            restaurants.collect do |restaurant|
            puts "#{restaurant.name}, #{restaurant.cuisine_type.name}, #{restaurant.rating}"
            end
         end

       when 'list by cuisine'
        controller = CuisineTypeController.new
        cuisine_type = controller.show_me_the_form
        controller = CuisineTypeController.new
        controller.list(cuisine_type)
       end
    end
      



#Pry.start


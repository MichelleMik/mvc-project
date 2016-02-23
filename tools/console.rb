require_relative '../config/environment.rb'
require_relative 'seed.rb'
require 'pry'


def reload!
    load('../config/environment.rb')
end

action = 0
  while action != 'exit'
      puts 'what is the action you would like to take'
      menu = "create\nshow\nlist restaurants\nlist by cuisine\nrecommend\nupdate"
      puts menu
      action = gets.chomp
      case action
      when 'create'
        controller = CuisineTypeController.new
        cuisine_type = controller.show_me_the_form
        controller = CuisineTypeController.new
         cuisine = controller.create(cuisine_type)
         binding.pry
        controller = RestaurantsController.new
        restaurant_name = controller.show_me_the_form
        controller = RestaurantsController.new
        controller.create(restaurant_name, cuisine)

       when 'show'
        controller = RestaurantsController.new
        restaurant_name = controller.show_me_the_restaurant_request
        controller = RestaurantsController.new
        controller.show(restaurant_name)

       when 'list restaurants'
         restaurants = Restaurant.all
         if restaurants == [] 
           puts "You have not created any restaurants"
         else
           restaurants.each do |restaurant|
             puts "#{restaurant.name}, #{restaurant.cuisine_type.name}, #{restaurant.rating}"
           end
         end

         when 'list by cuisine'
            controller = CuisineTypeController.new
            cuisine_type = controller.show_me_the_form
            controller = CuisineTypeController.new
            controller.list(cuisine_type)

        when 'update'
          #need to split and seperate into views and controllers
          puts "which restaurant would you like to update?"
          restaurant_name = gets.chomp
          restaurant = Restaurant.find_by_name(restaurant_name)
          puts "would you like to update the rating or location"
          update_item = gets.chomp
            if update_item == 'rating'
              puts "what is new rating?"
              new_rating = gets.chomp
              #restaurant.rating = new_rating.to_i
              new_rating.save
              puts "#{restaurant.name} rating has been updated to: #{restaurant.rating}."
              #Pry.start
            elsif update_item == 'location'
              puts "where is the new location?"
              new_location = gets.chomp
              #restaurant.location = new_location
              new_location.save
                puts "#{restaurant.name} location has been updated to : #{restaurant.location}."
        end

             

       
          when 'recommend'
            controller = CuisineTypeController.new
            cuisine_choice = controller.show_recommendation_form
            controller = CuisineTypeController.new
            controller.recommend(cuisine_choice)
      

          end
  
#Pry.start
      end
#Pry.start

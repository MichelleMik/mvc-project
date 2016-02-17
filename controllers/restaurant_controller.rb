class RestaurantsController
  
  def show_me_the_form
    view  = RestaurantNewView.new 
    view.render
  end
      
  def create(restaurant_name,cuisine_type)
    restaurant = Restaurant.new(restaurant_name,cuisine_type)
    puts "You have created #{restaurant.name}"
  end
      
  def show_me_the_restaurant_request
    puts 'what is the name of the restaurant you would like to see'
    restaurant_name = gets.chomp
  end

  def show(restaurant_name)
    restaurant = Restaurant.find_by_name(restaurant_name)
    puts "Restaurant: #{restaurant.name}, Cuisine : #{restaurant.cuisine_type.name}"
  end


        
end
        
   
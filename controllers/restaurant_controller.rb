class RestaurantsController
    def show_me_the_restaurants
        
        view = RestaurantNewView.new
        view.render
    end
    
    def create(restaurant)
        restaurant = Restaurant.new(restaurant)
        puts "great you have created #{restaurant.name}"
    end
end
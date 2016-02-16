class CuisineTypeController
    def show_me_the_form
      view  = CuisineTypeNewView.new #.rb
      view.render
    end
    
    def create(cuisine_type)
     if !CuisineType.find_by_name(cuisine_type)
      cuisine_type = CuisineType.new(cuisine_type)
      else
         cuisine_type =CuisineType.find_by_name(cuisine_type)
      end
      cuisine_type
    end

    def list(cuisine_type)
      cuisine_type = CuisineType.find_by_name(cuisine_type)
        cuisine_type.restaurants.each do |restaurant|
               puts "#{restaurant.name}"
        end
    end

end
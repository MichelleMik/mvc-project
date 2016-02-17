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
    
    def show_recommendation_form
      cuisine_types = CuisineType.all 
       puts "What type of cuisine are you in the mood for?"
      puts "Here are your available options: "
      cuisine_types.each {|type| puts type.name}
        cuisine_choice = gets.chomp
        #should we use render?
      end

    def recommend(cuisine_choice)
      cuisine_type = CuisineType.find_by_name(cuisine_choice)
      recommendation = cuisine_type.restaurants.sample
      puts "Restaurant: #{recommendation.name}, Cuisine : #{recommendation.cuisine_type.name}"
    end
      


end
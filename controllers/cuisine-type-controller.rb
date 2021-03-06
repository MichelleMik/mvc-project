class CuisineTypeController
    def show_me_the_form
      view  = CuisineTypeNewView.new 
      view.render
    end
    
    def create(cuisine_type)
       if !CuisineType.find_by_name(cuisine_type)
          cuisine_type = CuisineType.new(name: cuisine_type)
          cuisine_type.save
       end
           cuisine_type =CuisineType.find_by_name(cuisine_type) 
    end

    def list(cuisine_type)
      DB[:conn].results_as_hash = true
      sql = <<-SQL 
      SELECT restaurants.name FROM restaurants inner join cuisinetypes on 
      restaurants.cuisinetype_id = cuisinetypes.id 
      WHERE cuisinetypes.name = ?
      GROUP BY restaurants.name
      SQL
      result = DB[:conn].execute(sql,cuisine_type)
      result.map do |item|
         item["name"]
      end
      
    end
    
    def show_recommendation_form
      cuisine_types = CuisineType.all 
       puts "What type of cuisine are you in the mood for?"
      puts "Here are your available options: "
      cuisine_types.each {|type| puts type.name}
        cuisine_choice = gets.chomp
        
      end

    def recommend(cuisine_choice)
      cuisine_type = CuisineType.find_by_name(cuisine_choice)
      recommendation = cuisine_type.restaurants.sample
      puts "Restaurant: #{recommendation.name}, Cuisine : #{recommendation.cuisine_type.name}"
    end
      


end
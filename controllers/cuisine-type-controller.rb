class CuisineTypeController
    def show_me_the_cuisine_types
        
        view = CuisineTypeNewView.new
        view.render
    end
    
    def create(type_of_cuisine)
        cuisine_type = CuisineType.new(type_of_cuisine)
        puts "great you have created #{cuisine_type.name}"
    end
end
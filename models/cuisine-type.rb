require 'pry'
class CuisineType
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods
  

  
  self.column_names.each do |col|
    attr_accessor col.to_sym
  end
  
  

end



class Restaurant
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods
 

  self.column_names.each do |col|
    attr_accessor col.to_sym
  end

  def cuisine_type
    DB[:conn].results_as_hash = false
    sql = <<-SQL
    SELECT * FROM cuisinetypes WHERE id = ?
    SQL
    result = DB[:conn].execute(sql, self.cuisinetype_id).first
    attributes = CuisineType.column_names.zip(result).to_h
    
    new_item = CuisineType.new(attributes)
   
    new_item
    
  end
end



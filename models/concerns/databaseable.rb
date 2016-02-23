module Databaseable
  module ClassMethods

    def table_name
    "#{self.to_s.downcase}s"
  end

  def column_names
    DB[:conn].results_as_hash = true

    sql = "pragma table_info('#{table_name}')"

    table_info = DB[:conn].execute(sql)
    column_names = []
    table_info.each do |row|
      column_names << row["name"]
    end
    column_names.compact
  end
  

  def all 
    sql = <<-SQL
    SELECT * FROM #{table_name}
    SQL
    DB[:conn].execute(sql)
   end

  def find_by_name(name)
    DB[:conn].results_as_hash = false
    sql = <<-SQL
    SELECT * FROM #{table_name} 
    WHERE name = '#{name}'
    SQL
    result = DB[:conn].execute(sql)
    if result.empty?
      return nil
    else
      attributes = column_names.zip(result.first).to_h
      new_item = self.new(attributes)
    end
     new_item
  end


  def find_by(options = {})
    sql = "SELECT * FROM #{table_name} WHERE #{options.keys.first.to_s} = ?"
    DB[:conn].execute(sql,options.values.first)
  end
end


  module InstanceMethods

   def initialize(options = {})
    options.each do |property,value|
      self.send("#{property}=",value)
    end
   end

  def save
    sql = <<-SQL
    INSERT INTO #{table_name_for_insert}
    (#{col_names_for_insert}) VALUES
    (#{values_for_insert})
    SQL
    #binding.pry
    DB[:conn].execute(sql)
    id_getter = <<-SQL
    SELECT MAX(id) from #{table_name_for_insert}
    SQL
    @id = DB[:conn].execute(id_getter)[0][0]
  end


  def table_name_for_insert
    self.class.table_name
  end

  def col_names_for_insert
    self.class.column_names.delete_if{|item|item == "id"}.join(", ")
  end

  def values_for_insert
    values = []
    self.class.column_names.each do |name|
      values << "'#{send(name)}'" unless name == 'id'
    end
    values.join(", ")
    end 
  end

end

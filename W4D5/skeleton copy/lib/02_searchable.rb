require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable

  def where(params)
    # ...
    #params.keys 
    #params.values 
    
    where_keys = params.keys.map {|attribute| "#{attribute} = ?"}
    where_line = where_keys.join(" AND ")    

    results = DBConnection.execute(<<-SQL, *params.values)
      SELECT 
        * 
      FROM 
        #{self.table_name}
      WHERE 
         #{where_line}
    SQL
    results.map do |result| 
      self.new(result)
    end
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end

# where_keys = params.keys.map {|attribute| "#{attribute} = ?"}
# where_line = where_keys.join(" AND ")
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    # ...
    return @columns if @columns 
    @columns = DBConnection.execute2(<<-SQL)
      SELECT 
        * 
      FROM 
        #{self.table_name}
    SQL
    .first
    .map(&:to_sym)
    
  end

  def self.finalize!

    self.columns.each do |column| 
      define_method("#{column}=") do |value| 
        self.attributes[column] = value 
      end 
      
      define_method(column) do
        self.attributes[column] 
      end 
      
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
    # ...
  end

  def self.table_name
    @table_name || "#{self}".tableize 
    # ...
  end
require 'byebug'
  def self.all
    # ...
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM 
      #{self.table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    # ...
    results.map do |ele| 
      self.new(ele)
    end
  end
  def self.find(id)
    # ...
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        #{self.table_name}
      WHERE 
        #{self.table_name}.id = ?
    SQL
    return nil if result.nil?
    parse_all(result).first
  end

  def initialize(params = {})
    # ...
    params.each do |attr_name, attr_value| 
      if !self.class.columns.include?(attr_name.to_sym) 
        raise "unknown attribute '#{attr_name}'"
      else
        self.send("#{attr_name}=", attr_value) 
        #attr_name.to_sym = attr_value
      end
    end 
  end

  def attributes
    # ...
    @attributes ||= @attributes = {}
  end

  def attribute_values
    # ...
    self.class.columns.map { |attr| self.send(attr)} 
  end

  require 'byebug'
  def insert
    # ...
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    n = columns.count
    question_marks = (["?"] * n ).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO 
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    
    self.id = DBConnection.last_insert_row_id

  end

  def update
    # ...
    
    columns = self.class.columns
    col_names = columns.map {|attribute| "#{attribute} = ?"}
    set_line = col_names.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        #{self.class.table_name}.id = ?
    SQL

  end

  def save
    # ...
    if id.nil? 
      insert 
    else
      update 
    end
  end
end


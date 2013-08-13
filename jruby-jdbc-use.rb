require 'java'
require '/home/tim/dbdrivers/ojdbc6.jar'

odriver = Java::JavaClass.for_name("oracle.jdbc.driver.OracleDriver")

url = 'jdbc:oracle:thin:@ecnext171.ecnext.com:1521:mcetl'

def safeclose(to_close)
  #can't use 'to_close!=nil' because the underlying java invokes to_close.equals(null) which results in an exception
  if(!to_close.nil?)
    begin
      to_close.close
    rescue Exception => e
      puts e.message
    end
  end
end
def getColumns(rs)
  #if we want to be lazy or we don't know the columns that are going to be returned we can get a list of columns from the result set metadata
  meta = rs.get_meta_data
  l = meta.get_column_count
  columns = []
  l.times do |i|
    columns << meta.get_column_name(i+1)
  end
  return columns
end
closable = []
conn = nil
begin
  conn = java.sql.DriverManager.get_connection(url, "solr", "solr1")
rescue Exception => e
  puts e.message
end

statement = nil
rs = nil

query = "Select * from solr.ACTIVE_PBLS where mid like '001000%'"

begin
 statement = conn.create_statement
 rs = statement.execute_query(query)
 columns = getColumns(rs)
 while(rs.next)
   row_data = {}
   columns.each do |column|
      row_data[column] = rs.get_string(column)
   end
   puts row_data.to_s
 end
rescue Exception => e
  puts e.message
ensure
  safeclose(rs)
  safeclose(statement)
  safeclose(conn)
end

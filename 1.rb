class Table
    attr_reader :table_name, :collection
    def initialize(table_name, *collection)
        @table_name = table_name
        @collection = collection.map(&:to_i)
    end
    def max_collection
        @collection.max
    end
    def day 
        @collection.index {|x| x == self.max_collection} + 1
    end
    def average_collection
        @collection.inject(&:+) / @collection.size.to_f
    end
end

file = File.open('casino.txt', 'r')
data = file.readlines
file.close
table_list = []
data.each do |lines|
    ls = lines.split(', ')
    table_list << Table.new(*ls)
end
table_list.each do |table|
    puts "El Dia #{table.day}, el mayor valor fue de #{table.max_collection} en la #{table.table_name}"
end
puts 

averages = table_list.map(&:average_collection)
puts "El promedio total de lo recaudado por todas las mesas es #{averages.inject(:+) / averages.size}"

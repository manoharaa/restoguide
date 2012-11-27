require 'csv'

module Jurgensville


	def parse_csv(file_name)
		csv_text = File.read(file_name)
  	    csv = CSV.parse(csv_text)      	    
	    parse_rows(csv)   
	end

	def parse_rows(csv)	   
		hash = Hash.new
		csv.each do |row|	    	
        next if row.empty?
        	row.collect!{|r| r.strip}	
        	row_hash = item_values_hash(row)
       		hash.has_key?(row[0]) ? (hash[row[0]].merge!(row_hash)) : (hash[row[0]]	= row_hash)   			   		
        end    	
	    hash
	end

    def item_values_hash(row)    	
    	arr = []
    	[2..(row.length)].each do|val|
    		arr << row[val]		
        end
    	{ arr.join(',') => row[1]}
    end	

	def jurgensville_logic
		file_name = 'data.csv'
		hash = parse_csv(file_name) 
		input = "i1 i2".split(' ')		
		input_combinations(input)
	end

	def input_combinations(input)
		combinations = []
		(1..input.size).each do |val|			
			array = input.combination(val).to_a
			array.collect {|val| combinations << val.join(',')}			
		end	
		p combinations
	end	



end

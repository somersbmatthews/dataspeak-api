desc "This task converts a json file to ruby hash"
task :JSON_file_to_hash_file do |JSON_file|
	    @JSON = File.read(JSON_file)
      @array_of_objects = JSON.parse(@JSON)
      @string_of_array = " "'" + #{@array_of_objects} + "'" "
      @output = File.new('nasdaq_hash.rb', 'w')
      # './nasdaq.json'
      @output.write(@string_of_array)
      @output.close
end
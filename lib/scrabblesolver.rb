while true
  puts "Enter a word and I'll check if it's in the dictionary"
  input = gets.downcase
  words = []

  # /usr/share/dict/words is a unix standard dictionary file
  File.open('/usr/share/dict/words') do |file|
    file.each do |line|
      if input == line
        puts "Your word is in the dictionary"
      end
    end
  end
end



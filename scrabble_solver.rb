# This script will give all possible dictionary valid words bulit from anagram

def build_words
  # /usr/share/dict/words is a unix standard dictionary file
  @words = []
  File.open('/usr/share/dict/words') do |file|
    file.each do |line|
      @words << line.chomp
    end
  end
end

def anagram_builder(input)
  #story each letter of string into an array
  word = input.split(%r{\s*})
  @val = word.repeated_permutation(word.size).to_a
  @val.map! { |t| t.join"" }
  @val.uniq!
end

def word_checker

  while true
    puts "Enter a word and I'll check if it's in the dictionary"
    input = gets.downcase
    anagram_builder(input)
     #  puts "Comparing {#@words} and {#i}"
      @val.each do |x|
        if @words.include? x.chomp
        puts " #{x} is a valid word"
      end
    end
  end
end

build_words
word_checker

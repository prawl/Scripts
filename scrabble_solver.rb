# This script will give all possible dictionary valid words bulit from anagram

def build_words
  # /usr/share/dict/words is a unix standard dictionary file
  @words = []
  File.open('/usr/share/dict/words') do |file|
    file.each do |line|
     @words << line
    end
  end
end

def anagram_builder(input)
  #story each letter of string into an array
  word = input.split(%r{\s*})
  val = word.repeated_permutation(word.size).to_a
  arr = []
  val.each do |t|
   val = t.join''
  end
  puts val.size
end

def word_checker
  puts "Enter a word and I'll check if it's in the dictionary"

  while true
    input = gets.downcase
    anagram_builder(input)
    if @words.include? input
      puts "Valid word"
    else
      puts "Invalid word"
    end
  end
end

build_words
word_checker

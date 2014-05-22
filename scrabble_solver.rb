# I created this script for the sole purpose of beating my girl friend in scrabble

def build_words
  # /usr/share/dict/words is a unix standard dictionary file
  file_path = '/usr/share/dict/words'
  @words = []
  File.open(file_path) do |file|
    file.each do |line|
      @words << line.chomp
    end
  end
end

def anagram_builder(input)
  input = input.split''
  @val = (4..input.size).flat_map{|n| (input).to_a.permutation(n).map(&:join)}
end

def word_checker
  while true
    puts "Enter a word and I'll give you all valid dictionary anagrams"
    input = gets.downcase
    anagram_builder(input)
    @val.each do |x|
      if @words.include? x
        puts x
      end
    end
  end
end

build_words
word_checker

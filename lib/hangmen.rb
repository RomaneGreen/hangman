
require 'yaml'

class Game

attr_accessor :name

def initialize(name,queueWin,queueLoss)
  @name = name
  @queueWin = []
  @queueLoss = []
end

  def play

secret_word = "Pita"
secret_word.downcase!
final_word = secret_word.gsub(/[a-z]/," _ ")
@queueWin = []
@queueLoss = []
until queueWin.length == secret_word.length || queueLoss.length == 10



puts "Welcome to ruby hangman"



 puts "Guess a letter [sve:save/ext:exit]"

letter = gets.chomp.downcase
if letter == 'sve'
   save
end
if secret_word.include? letter

  puts "Good guess"
  answer = secret_word.index(letter)
  final_word[answer] = letter
   final_word.sub!(/ _ /,'')
   queueWin << final_word
   puts final_word
else
  puts "Incorrect,try again"
  puts final_word
  queueLoss << letter
end
end

if queueWin.length == secret_word.length
  puts "Congrats! You've won"
elsif queueLoss.length == 10
puts "You Lost.Please try again!"
end
  end
def save
puts "Would you like to save game(y/n)"
File.open("saved-game.yaml", "w") do |file|
      file.write(YAML::dump(self))
      exit
end

def load

end
end

end




# Gaming =  Game.new
#   Gaming.play

Game.new('kev').play

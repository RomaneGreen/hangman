require "yaml"

class Game

def play
words = File.readlines("five_desk.txt")

pick = words.select { |w| w.size > 5 && w.size < 12 }.sample

secret_word = pick
secret_word.downcase!
final_word = secret_word.gsub(/[a-z]/," _ ")
queueWin = []
queueLoss = []
guessed_letters = []
until queueWin.length == secret_word.length || queueLoss.length == 20
puts "Welcome to ruby hangman"
puts "Guess a letter"

letter = gets.chomp.downcase
if guessed_letters.include? letter
puts "you guessed that already!"
puts final_word
elsif secret_word.include? letter
guessed_letters << letter
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
  puts "Congrats! Youve won You guessed #{pick}"
elsif queueLoss.length == 20
  puts "You Lost. The word was #{pick}Please try again!"
end
end
end

first_play = Game.new
first_play.play

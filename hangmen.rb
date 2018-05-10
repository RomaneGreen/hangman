


words = File.readlines("five_desk.txt")

pick = words.select { |w| w.size > 5 && w.size < 12 }.sample

puts pick

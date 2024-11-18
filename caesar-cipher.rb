def checkNumber(n)
  n.to_s

  until n.match?(/\A\d+\z/) do
    puts "Only numbers between 1 to 25"
    n = gets.chomp
  end

  n = n.to_i
end

def checkNumberBetween(n)
  until n.between?(1, 25) do
    puts "Only numbers between 1 to 25"
    n = gets.chomp
    n = checkNumber(n)
  end
  
  n
end

def caesar_cipher(s, n)
  array = ("a".."z").to_a
  s.gsub(/[a-z]/) do |letter|
    index = (array.index(letter) + n) % array.size
    array[index]
  end
end

puts "Write something"
string = gets.chomp

until string =~ /^[a-zA-Z\s]+$/ do
  puts "Only letters of the alphabelt and space"
  string = gets.chomp
end

string = string.downcase
puts "The phrase you written: #{string}"

puts "Choose a number between 1 to 25"
key = gets.chomp

key = checkNumber(key)
key = checkNumberBetween(key)

puts "The number you chose: #{key}"

new_string = caesar_cipher(string, key)

puts "Original: #{string}\nencrypted: #{new_string}"
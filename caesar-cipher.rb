def checkNumber(n)
  n.to_s

  until n.match?(/\A\d+\z/) do
    puts "Only numbers"
    n = gets.chomp
  end

  n =  n.to_i
end

puts "Write something"
string = gets.chomp

until string =~ /^[a-zA-Z]+$/ do
  puts "Only letters of the alphabelt"
  string = gets.chomp
end

puts "Choose a number between 1 to 25"
key = gets.chomp

key = checkNumber(key)

until key.between?(1, 25) do
  puts "Between 1 to 25"
  key = gets.chomp
  key = checkNumber(key)
end
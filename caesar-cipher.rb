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

def encrypt(s, n)
  array = ("a".."z").to_a
  s.gsub(/[a-z]/) do |letter|
    index = (array.index(letter) + n) % array.size
    array[index]
  end
end

def decrypt(s, n)
  array = ("a".."z").to_a
  s.gsub(/[a-z]/) do |letter|
    index = (array.index(letter) - n) % array.size
    array[index]
  end
end

loop do 
  puts "Write something"
  string = gets.chomp

  until string =~ /^[a-zA-Z\s]+$/ do
    puts "Only letters of the alphabet and space"
    string = gets.chomp
  end

  string = string.downcase
  puts "The phrase you written: #{string}"

  puts "Choose a number between 1 to 25"
  key = gets.chomp

  key = checkNumber(key)
  key = checkNumberBetween(key)

  puts "The number you chose: #{key}"

  puts "Do you want to encrypt or decrypt the sentence?\n1) Encrypt\n2) Decrypt"
  
  loop do 
    choice = gets.chomp.to_i

    case choice
      when 1
        new_string = encrypt(string, key)
        puts "Original: #{string}\nencrypted: #{new_string}"

        break
      when 2
        new_string = decrypt(string, key)
        puts "Original: #{string}\ndecrypted: #{new_string}"
        
        break
      else
        puts "Choose between:\n1) Encrypt\n2) Decrypt"
    end
  end

  puts "Do you want to continue using the programme?\nPress any key other than 'n' or enter to continue\n'n' to close"
  again = gets.chomp.downcase

  if again === "n"
    break
  end  
end
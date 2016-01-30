#Ruby Monk Primary
#0.1

#invoking next twice on 1 to get 3.
1.next.next

#simply call the method sort on the result of methods:
1.methods.sort

#Try using a method that takes two arguments - 
#use the between? method to determine if the number 2 lies between the numbers 1 and 3.
2.between? 1, 3

#1.1
#given a String as the argument, inserts the length of that String into another String:
def string_length_interpolater(incoming_string)
  "The string you just gave me has a length of #{incoming_string.length}"
end

"[Luke:] I can’t believe it. [Yoda:] That is why you fail.".include? "Yoda"

"Ruby is a beautiful language".start_with?'Ruby'

"I can't work with any other language but Ruby".end_with?'Ruby'

"I am a Rubyist".index"R"

'This is Mixed CASE'.downcase

"ThiS iS A vErY ComPlEx SenTeNcE".swapcase

'Fear is the path to the dark side'.split(' ')

'RubyMonk Is Pretty Brilliant'.gsub(/[A-Z]/,'0')

 #find the second character in the string 'RubyMonk Is Pretty Brilliant' preceded by a space, which should be 'P'
'RubyMonk Is Pretty Brilliant'.match(/ ./,9)

#2.0
age >= 23 && (name == 'Bob'||name=='Jill')

def check_sign(number)
  if number == 0
    number
  elsif number > 0
    "#{number} is positive"
  else
    "#{number} is negative"
  end        
end

if 0
  puts "Hey, 0 is considered to be a truth in Ruby" 
end


loop do
  monk.meditate
  break if monk.nirvana?
end

# add a loop inside this method to ring the bell 'n' times
def ring(bell, n)
  n.times do
    bell.ring
  end
end  

#extract the 5th value from the array below
[1, 2, 3, 4, 5, 6, 7][4]

#extract the last value from the array below
[1, 2, 3, 4, 5][-1]

[1, 2, 3, 4, 5]<<"woot"
[1, 2, 3, 4, 5].push("woot")

[1, 2, 3, 4, 5].map{|i| i*3}

names = ['rock', 'paper', 'scissors', 'lizard', 'spock']
names.select {|name| name.length >5}

#delete element 5
[1,3,5,4,6,7].delete(5)

[1,2,3,4,5,6,7,8,9].delete_if{|i| i % 2 == 0}

def array_copy(source)
  destination = []
  for i in source
    destination.push(i) if i<4
  end
  return destination
end


def array_copy(source)
  destination = []
  source.each do |i|
    destination << i if i < 4
  end
  return destination
end

##########
restaurant_menu = {"Ramen"=>3,"Dal Makhani"=>4,"Tea"=>2}
restaurant_menu["Ramen"]


restaurant_menu = {}
restaurant_menu["Dal Makhani"]=4.5
restaurant_menu["Tea"]=2


restaurant_menu = { "Ramen" => 3, "Dal Makhani" => 4, "Coffee" => 2 }
restaurant_menu.each do |item, price|
    restaurant_menu[item]=price*1.1
end

#########
class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end
  def area
    @length*@breadth
  end
end

########
def add_two(num)
  return num.next.next
end

#######
def introduction (age, gender, *names)
  "Meet #{names.join(' ')}, who's #{age} and #{gender}"
end

######
def add(*numbers)
  numbers.inject(0){|sum, number|sum + number}
end
def subtract(*numbers)
  result = numbers.shift
  numbers.inject(result){|result, number| result-number}
end
def calculate(*arguments)
  options = arguments[-1].is_a?(Hash)? arguments.pop : {}
  options[:add]=true if options.empty?
  return add(*arguments)if options[:add]
  return subtract(*arguments)if options[:subtract]
end

##########
Increment = lambda {|number| number +1 } # your lambda between the braces

def calculate(a,b)
  yield(a,b)
end

#############
module Perimeter
  def perimeter
    sides.inject(0) {|sum,side| sum + side}
  end
end

class Rectangle
  include Perimeter
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def sides
    [@length, @breadth, @length, @breadth]
  end
end

class Square
  include Perimeter
  def initialize(side)
    @side = side
  end

  def sides
    [@side, @side, @side, @side]
  end
end

####8.2
module RubyMonk
  module Parser
    class TextParser
      def self.parse(str)
        str=str.upcase.split("")
      end
    end
  end
end


#############
module Kata
  A = 5
  module Dojo
    B = 9
    A = 7
    
    class ScopeIn
      def push
        ::A
      end
    end
  end
end

A = 10
#Kata::Dojo::ScopeIn.new.push should return 10

#9.1
#capture STDERR so that calls to warn are redirected to our custom StringIO object.
capture = StringIO.new
$stderr = capture

################
what_am_i = File.open("clean-slate.txt", "w") do |file|
  file.puts "Call me Ishmael."
end
p what_am_i
File.open("clean-slate.txt", "r") {|file| puts file.read }


###################
file = File.open("master", "r+")

p file.read
file.rewind # try commenting out this line to see what happens!
            # can you guess why this happens?

buffer = ""
p file.read(23, buffer)
p buffer

file.close

###############
p File.read("monk")

File.open("monk") do |f|
  f.seek(20, IO::SEEK_SET)
  p f.read(10)
end


##############
lines = File.readlines("monk")
p lines
p lines[0]


###########

File.open("disguise", "w") do |f|
  f.write "Bar"
end

#Problem Statement
#Given a sentence containing multiple words, 
#find the frequency of a given word in that sentence.
def find_frequency(sentence, word)
  # Your code here
  sentence.downcase.split(" ").count(word.downcase)
end

#Problem Statement
#Create a method named 'sort_string' which accepts a String and rearranges 
#all the words in ascending order, by length. Let's not treat the punctuation 
#marks any different than other characters and assume that we will always have 
#single space to separate the words.
def sort_string(string)
  # your code here
  string.split(" ").sort! {|x, y| x.length <=> y.length}.join(" ")
end

#Problem Statement
#Create a method 'random_select' which, when given an array of elements (array) 
#and a number (n), returns n randomly selected elements from that array.
def random_select(array, n)
  # your code here
  i = 0
  result = []
  until i >= n do 
    result << array[rand(array.length)]
    i += 1
  end
  return result
end

#Problem Statement
#9 is a Kaprekar number since 
#9 ^ 2 = 81 and 8 + 1 = 9
def kaprekar?(k)
  str = (k**2).to_s
  n = k.to_s.length
  num2 = str.slice!(-n..-1).to_i
  num1 = str.slice!(0..str.length-n-1).to_i 
  num = num1 + num2
  return num == k
end

#Problem Statement
#Let us say you are trying to recruit team-members for your new startup! Given 
#a candidate, you need an expression that will tell you whether they fit into 
#certain types. This is how a candidate object would look:
candidate.years_of_experience = 4
  candidate.github_points = 293
  candidate.languages_worked_with = ['C', 'Ruby', 'Python', 'Clojure']
  candidate.applied_recently? = false
  candidate.age = 26

is_an_experienced_programmer = # Fill your expression here
(candidate.languages_worked_with.include? 'Ruby' ) &&
(candidate.years_of_experience >= 2 || candidate.github_points >= 500) &&
!(candidate.age < 15 || candidate.applied_recently? )

#Problem Statement
#Given a sentence, return true if the sentence is a palindrome.
def palindrome?(sentence)
  # Write your code here
  temp = sentence.downcase.gsub(" ", "")
  if temp == temp.reverse
    return true
  else
    return false
  end
end

#Problem Statement
#Compute the sum of cubes for a given range a through b.
def sum_of_cubes(a, b)
  # Write your code here
    (a..b).inject(0) {|sum, n| sum += (n*n*n)}
 end

 #Problem Statement
#Given an Array, return the elements that are present exactly once in the array.
def non_duplicated_values(values)
  # Write your code here
    values.find_all {|a| values.count(a) == 1}
end

#Problem Statement
#Given an array, return true if all the elements are Fixnums.
def array_of_fixnums?(array)
  # Write your code here
  array.all? {|a| a.is_a? Fixnum}
end

#Problem Statement
#You are given some code in the form of lambdas. 
#Measure and return the time taken to execute that code. 
def exec_time(proc)
  # your code here
  begin_time = Time.now
  proc.call
  Time.now - begin_time
end

#Problem Statement
#Given a 3 or 4 digit number with distinct digits, return a sorted array of all 
#the unique numbers that can be formed with those digits.
def number_shuffle(number)
  # your code here
  n = number.to_s.length == 3? 6 : 24
  digits = number.to_s.split(//)
  results = []
  results << digits.shuffle.join.to_i while results.uniq.size != n
  
  results.uniq.sort
end

#Problem Statement
#A restaurant has incoming orders for which you need to compute the costs based 
#on the menu.
#You might get multiple orders at times.
class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def cost(*orders)
    # your code here
    orders.inject(0) do |total_cost, order| 
      total_cost + order.keys.inject(0) {|cost, key| cost +                          
       order[key] * @menu[key]}
    end
  end
end

#Problem Statement
#Given a custom class MyArray, 
#write a 'sum' method that takes a block parameter.
class MyArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sum(initial_value = 0)
    # your code here
     return array.inject(:+) + initial_value unless block_given?
    sum = initial_value
    array.each {|n| sum += yield(n)}
    sum
  end
end














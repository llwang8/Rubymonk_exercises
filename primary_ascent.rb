#Ruby Monk - Primary Ascent

#Block
Addition = lambda {|a, b| return a+b} # use this as your example!

Subtraction = lambda {|a,b| return a-b } # your code between the braces

Multiplication = lambda {|a,b| return a*b } # your code between the braces

Division = lambda {|a,b| return a / b } # your code between the braces

----------------------
def foo
 puts yield
 puts method(:foo)
 # uncomment the following line and see what happens! 
 #puts method(:yield)
end
foo { "I expect to be heard." }

#--------------------------
def calculation(a, b, operation)
  operation.call(a, b)
end
puts calculation(5, 6, lambda { |a, b| a + b }) # addition
puts calculation(5, 6, lambda { |a, b| a - b }) # subtraction

#--------------------------
def foo
  yield if block_given?
end
#--------------------------
require "benchmark"

def calculation_with_explicit_block_passing(a, b, operation)
 operation.call(a, b)
end

def calculation_with_implicit_block_passing(a, b)
 yield(a, b)
end

Benchmark.bmbm(10) do |report|
 report.report("explicit") do
   addition = lambda { |a, b| a + b }
   1000.times { calculation_with_explicit_block_passing(5, 5, addition) }
 end

 report.report("implicit") do
   1000.times { calculation_with_implicit_block_passing(5, 5) { |a, b| a + b } }
 end
end

#-------------------------------------
def prettify_it
  "The result of the block was: #{yield}"
end

#---------------------------

def filter(array, block)
 return array.select(&block)
end

#---------------

Filter = lambda do |array,&block|
 array.select(&block)
end

#--------------

addition = lambda {|a, b| a + b }
puts addition.call(5, 5)

addition = lambda {|a, b|
 a + b
}
puts addition.call(5, 5)

addition = lambda do |a, b|
 a + b
end
puts addition.call(5, 5)

addition = lambda do |a, b|; a + b; end
puts addition.call(5, 5)

#----------------
#The -> literal form is a shorter version of Kernel#lambda
short = ->(a, b) { a + b }
puts short.call(2, 3)

long = lambda { |a, b| a + b }
puts long.call(2, 3)
#-----------------------
short = proc { |a, b| a + b }
puts short.call(2, 3)

long = Proc.new { |a, b| a + b }
puts long.call(2, 3)

#------------------

def know_it_all(object)
  # Your code here
  object.class
end

#------------------
#Use a while loop to walk up the hierarchy starting with subclass. 
#Stop when you get a nil (you've hit BasicObject) or when you find klass.
def is_ancestor?(klass, subclass)
  # your code here
  current_class = subclass
  while !current_class.superclass.nil? && current_class != klass
    current_class = current_class.superclass
  end
  current_class == klass
end

#-------------------

class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end
end

# Create a class Square here
class Square < Rectangle
  def initialize(side)
    @length = side
    @breadth = side
  end
end

#-------------------
#Open the Fixnum class and create a method + that takes one parameter. Have 
#this method return 42. Since + already exists, you're basically redefining it 
#- and breaking integer addition for your program.
class Fixnum
  def +(other)
    32
  end
end

#--------------------

class Animal
  def move
    "I can move"
  end
end

class Bird < Animal
  def move
    super + " by flying"
  end
end

# Your code here
class Human < Animal
  def move
    super + " by walking"
  end
end
class Penguin < Bird
  def move
    "I can move by swimming"
  end
end

#----------------------

class Item
  def initialize(description, color)
    @description = description
    @color = color
  end
  
  # your code here
  def description
    "#{@description} + #{@color}" 
  end

  #---------------------

  class Item
  def initialize(item_name, quantity)
    @item_name = item_name
    @quantity = quantity
  end
  
  def quantity=(new_quantity)
      # your code here
    @quantity = new_quantity
  end
  
  def quantity
    @quantity
  end  
end

item = Item.new("a",1)
item.quantity = 3
p item.quantity

#-------------------------

class Item
  attr_writer :description, :color
  
  def initialize(description, color)
    @description = description
    @color = color
  end
end

#--------------------------

class ApplicationConfiguration
  @@configuration = {}
  def self.set(property_name, value)
    @@configuration[property_name] = value
  end
  
  def self.get(property_name)
    @@configuration[property_name]
  end  
end

ApplicationConfiguration.set("name", "Demo Application")
ApplicationConfiguration.set("version", "0.1")

p ApplicationConfiguration.get("version")

#------------------------

class ApplicationConfiguration
  @configuration = {}

  def self.set(property, value)
    @configuration[property] = value
  end

  def self.get(property)
    @configuration[property]
  end
end

class ERPApplicationConfiguration < ApplicationConfiguration
  @configuration = {}
end

class WebApplicationConfiguration < ApplicationConfiguration
  @configuration = {}
end

ERPApplicationConfiguration.set("name", "ERP Application")
WebApplicationConfiguration.set("name", "Web Application")

p ERPApplicationConfiguration.get("name")
p WebApplicationConfiguration.get("name")

p ApplicationConfiguration.get("name")

#---------------------------------------
#The == method which we just defined always return false. Now fix it to 
#return true if the item_name and qty of your object is the same as that of the 
#object being compared with.
class Item
    attr_reader :item_name, :qty
    
    def initialize(item_name, qty)
        @item_name = item_name
        @qty = qty
    end
    def to_s
        "Item (#{@item_name}, #{@qty})"
    end
    def ==(other_item)
      # your code here
      (self.item_name == other_item.item_name)  & (self.qty == other_item.qty)
    end
end

p Item.new("abcd",1)  == Item.new("abcd",1)
p Item.new("abcd",2)  == Item.new("abcd",1)

#----------------------------------

#Here is the final exercise in this lesson. I have an Item class which stores the item name, 
#quantity and price. You have to implement the equality methods for this object. Remember, 
#you have to:

#Define a == method that compares the state of your object with that of the other one and 
#returns a boolean value.
#Define a eql? method that simply calls the == to do the actual comparison.
#Define a hash method that returns the result of XORing (using the ^ operator) the hash of 
#all that instance variables which together determine the state of the object.

class Item
  attr_reader :item_name, :quantity, :supplier_name, :price
  
  def initialize(item_name, quantity, supplier_name, price)
    @item_name = item_name
    @quantity = quantity
    @supplier_name = supplier_name
    @price = price
  end 
  
  # implement ==, eql? and hash
   def ==(other_item)
      (@item_name == other_item.item_name ) && 
      (@quantity == other_item.quantity) && 
      (@supplier_name == other_item.supplier_name) && 
      (@price == other_item.price)
  end
  
  def eql?(other_item)
    self ==(other_item)
  end
  
  def hash
    item_name.hash ^ quantity.hash ^ supplier_name.hash ^ price.hash
end
end

#--------------------------

class Item
  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end
  
	# override 'to_s' here  
  def to_s
    "@item_name = #{@item_name}  @qty = #{@qty}"
  end
end

item = Item.new("a",1)

puts item
p item

#------------------------------

 #In the exercise below, try to write a to_s method that produces a string 
 #from_s understands.
 class CerealBox
  attr_accessor :ounces, :contains_toy
  
  def initialize(ounces, contains_toy)
    @ounces = ounces
    @contains_toy = contains_toy
  end
  
  def self.from_s(s)
    ounces = 0
    contains_toy = false
    s.each_line do |field|
      value = field.split(":")[1].strip
      ounces = value.to_i if field.include?("ounces")
      contains_toy = to_boolean(value) if field.include?("contains_toy")
    end
    CerealBox.new(ounces, contains_toy)
  end
  
  def self.to_boolean(str)
    str == 'true'
  end
  
  def to_s
    "@ounces:#{@ounces}\n @contains_toy: #{@contains_toy}"
  end
end

puts "example to_s: #{CerealBox.new(4, true).to_s}"
# try this too!
#puts "example from_s: #{CerealBox.from_s(CerealBox.new(10, false).to_s)}"

#----------------------------
#Finish the exercise so that the game characters can be saved to disk and loaded later. 
#To save a YAML string to disk, use the handy GameFile#write(yaml) and GameFile#read methods 
#I've written for you. GameFile.new accepts one parameter, which should be a .yaml file.
class Ogre
  attr_accessor :strength, :speed, :smell
  def initialize(strength, speed, smell)
    @strength = strength
    @speed = speed
    @smell = smell
  end
end

class Dragon
  attr_accessor :strength, :speed, :color
  def initialize(strength, speed, color)
    @strength = strength
    @speed = speed
    @color = color
  end
end

class Fairy
  attr_accessor :strength, :speed, :intelligence
  def initialize(intelligence)
    @strength = 1
    @speed = 42
    @intelligence = intelligence
  end
end

def save_game(characters)
	# TODO: serialize a character hash of :ogres, :dragons, and :fairies
  yaml = YAML::dump(characters)
  game_file = GameFile.new("/my_game/saved.yaml")
  game_file.write(yaml) 
end

def load_game
  # TODO: return a deserialized hash of characters
  game_file = GameFile.new("/my_game/saved.yaml")
  yaml = game_file.read
  YAML::load(yaml)
  
end

#--------------------------
#3.0

# compute([[4, 8], [15, 16]])

def compute(ary)
  return nil unless ary
  ary.map {|a, b| !b.nil? ? a + b : a }
end

#----------------------------

first,*middle, last = [42, 43, 44, 45, 46, 47]

#--------------------------

def median(*list)
  # write your method here
  return nil if list.empty?
  arr = list.sort!
  n = arr.length
  if arr.length.odd?
    return (n+1)/2
  else
    return ((n/2) + ((n/2) + 1).to_f)/2.0
  end
end

#------------------------

[4, 8, 15, 16, 23, 42].count { |e| e.even? } 

#--------------------------

def zen(array)
	# write your method here
  (array.flatten.compact.index(42)  == 5) ? array.flatten.compact.count : nil
end

#--------------------------

def few2last(array)
  array.slice(-2..-1).join("|")
end

#---------------------------

#Modify the above example to make the Stack class statically sized. push and pop should 
#return nil if the stack is overflowing or underflowing respectively. Implement private 
#predicate methods full? and empty? and public method size that returns the length of the 
#stack, and look that returns the value on the top of the stack.

class Stack
  def initialize(size)
    @top = -1
    @store = Array.new(size)
    @size = size
  end
  
  def pop
    if empty?
      nil
    else
      popped = @store[@top]
      @store[@top] = nil
      @top = @top.pred
      popped
    end
  end
  
  def push(element)
    if full? or element == nil
      nil
    else
      @top = @top.succ
      @store[@top] = element
      self 
    end
  end
  
  def size
    @size
  end
  
  def look
    @store[@top]
  end
  
  private
  
  def full?
    @top == (@size - 1)
  end
  
  def empty?
    @top == -1
  end
end

#---------------------

#Write your own implementation of a Queue that is also statically sized. Like in the 
#stack exercise before, enqueue and dequeue should return nil for overflow or underflow.

class Queue
  def initialize(size)
    @size = size
    @store = Array.new(@size)
    @head, @tail = -1, 0
  end
  
  def dequeue
    if empty?
      nil
    else
      @tail = @tail.succ
      dequeued = @store[@head]
      @store.unshift(nil)
      @store.pop
      dequeued
    end
  end
  
  def enqueue(element)
    if full? or element.nil?
      nil
    else
      @tail = @tail.pred
      @store[@tail] = element
      self
    end
  end
  
  def size
    @size
  end
  
  private
  
  def full?
    @tail.abs == (@size) 
  end
  
  def empty?
    @head == -1 and @tail == 0
  end
end

#------------------------
#Fill out the template for your robot below. A customer will call the place_order method, 
#which you'll have to pass on to the chef robot with your robot's name. The chef will then 
#call your robot's serve method when the customer's sandwich is ready. Your robot needs to 
#serve the correct sandwich/drink combo to the correct table at that point from the chef's 
#sloppy data format.
class WaiterRobot

  def initialize(chef, tables)
    @chef = chef
    @tables = tables
    @name = "Tyler Durden"
  end
  
  def name
    @name
  end
  
  def place_order(table_number, sandwich, drink)
    # tell the chef with Chef#new_order(waiter_robot, order_hash)
    order = {:table => table_number, :sandwich => sandwich, :drink => drink}
    @chef.new_order(self, order)
  end
  
  def serve(order)
    # digest the chef's sloppy order instructions:
    # 1) find the table number you need to serve
    o = Hash[*order]
    table_number = o[:table]
    table = @tables[table_number]
    # 2) call Table#serve_sandwich and Table#serve_drink
    table.serve_sandwich(o[:sandwich])
    table.serve_drink(o[:drink])
  end
  
end

#-----------------------------

#Let's assume we're not restricting couples in any way -- the only rule is no one can 
#create a couple by him/herself.
CHARACTERS = ["Joey Jeremiah", "Snake Simpson", "Wheels", "Spike Nelson", "Arthur Kobalewscuy", "Caitlin Ryan", "Shane McKay", "Rick Munro", "Stephanie Kaye"]

def degrassi_couples
  # match 'em up!
  all = CHARACTERS.product(CHARACTERS)
  all.reject! {|a| a.first == a.last}
end

#-----------------------------
#transpose
class Announcements
  def initialize(printer)
    @printer = printer
  end
  
  def notify_user(column_table)
    row_table = column_table.transpose
    @printer.print_with_ink(row_table)
  end
end

#-----------------------------

module Foo
  def method_in_module
   	"The method defined in the module invoked"
  end
end

class Bar
  def initialize
    self.extend Foo
  end
end

#------------------------

# your code here
module Math
  def self.square(n)
    n ** 2
  end
end

puts Math.square(6) 

#--------------------
#begin, rescue, end

EXAMPLE_SECRETS = ["het", "keca", "si", nil, "iel"]

def decode(jumble)
  secret = jumble.split("").rotate(3).join("")
  announce(secret)
  secret
end
def decode_all(secrets)
  secrets.map {|s| decode(s)}
rescue
  puts "safe"
end

#---------------------

EXAMPLE_SECRETS = ["het", "keca", "si", nil, "iel"]

def decode(jumble)
  secret = jumble.split("").rotate(3).join("")
  announce(secret)
  secret
end
def decode_all(secrets)
  secrets.map {|s| decode(s) } rescue "it's okay, little buddy."
end

#--------------------

def zen
  begin
    p eval "(40 + 2) / 2"
    p eval "(40 + 2) \ 2"
  rescue SyntaxError => error
    puts error.backtrace
  end
end

zen

#---------------------

def zen
  begin
    p eval "(40 + 2) / 2"
    p eval "(40 + 2) \ 2"
    p eval "4, 8, 15, 16, 23, 42"
  rescue SyntaxError => error
    puts error.backtrace
  end
end

zen

#------------------

class KasayaError < StandardError
end

def robe(type)
  unless type.downcase == "kasaya"
    raise KasayaError, "Wrong robe!"
  end
  
  "Dharmaguptaka's " + type.capitalize + " Robe"
end

#-----------------

floor = [["blank", "blank", "blank"],
         ["gummy", "blank", "blank"],
         ["blank", "blank", "blank"]]

attempts = 0
candy = catch(:found) do
	floor.each do |row|
  	row.each do |tile|
      attempts += 1
    	throw(:found, tile) if tile == "jawbreaker" || tile == "gummy"
  	end
	end
end
puts candy
puts attempts

#---------------------

floor = [["blank", "blank", "blank"],
         ["gummy", "blank", "blank"],
         ["blank", "blank", "blank"]]

def search(fl)  
  fl.each do |row|
    row.each do |tile|
      return tile if tile == "jawbreaker" || tile == "gummy"
    end
  end
end

puts candy = search(floor)

#---------------------------------

def an_array_with_5_elements
  # fill me
  [3,6,9,12,15]
end

def a_string_longer_than_10_characters
  # fill me
  'concentration'
end

def a_number_with_a_decimal_place
  # fill me
  3.5
end

def an_array_of_hashes
  # fill me
  [{:name =>"fruit", :quantity=>5}, {:city=>"London", :country=>"England"}]
end

def an_array_of_arrays
  # fill me
  [[1,2,3], ["am", "pm"]]
end

#----------------------

def big_num
  # create a huge number
 return 1_000_000_000_000_000_000_000
end

describe(big_num)

#--------------------

def quoted_string(to_be_quoted)
  "Suuuure. You were just \"#{to_be_quoted}\"."
end

#---------------------

def multi_line_string(*lines)
  # newline, carriage-return, whatever-you-call it.
  "Here are your lines!\n\n#{lines.join("\n")}"
end

#---------------------

def big_q_string(numerator, denominator)
	# big Q!
   %Q[This %Q syntax is the ugliest one.\n#{numerator} out of #{denominator} "dentists" agree.]

end

#---------------------

def repetitive_array_of_strings
  ["Wow,", "this", "is", "a", "pretty", "long", "list", "of", "words", "and", "it", "took", "me", "a", "long", "time", "to", "type", "because", "of", "all", "those", "darn", "quote", "characters.", "Geez."]
end

def array_of_words_literal
  %w[With this double-u shorthand it wasn't very hard at all to type out this list of words. Heck, I was even able to use double-quotes like "these"!]
end

#------------------------

def one_less
  # how can we change those dots to get 1 through 49?
  1...10
end

#------------------

def range_of_characters
  # an easy one!
  'a'..'z'
end

#-------------------

#Ruby does have some predefined globals which you may make use of from time to time. These include 
#  $* (the command-line arguments used to execute this Ruby program), 
#  $@ (the location of the last error), 
#  $~ (the last regular expression match), and 
#  $0 (the name of the current ruby script). 

def last_error
  $@
end

def this_script_name
  $0
end

#----------------------

# Constants

Argument::Truth = "No, you're not."

def awkward_sheep
  sheep = Class.new do
    def speak
      "Bah."
    end# create a class here with a method 'speak'
  end
end

#-----------------------

module Fence
	# create your class here 
  Sheep = Class.new do 
    def speak
      "Bah."
    end
  end
end

def call_sheep
  # create a new sheep and make it talk!
  Fence::Sheep.new.speak
end

#-----------------------

class Array
  def map_with_index(&block)
    self.each_with_index.map(&block)
  end
end

#------------------------

def hash_keys(hash)
  hash.map {|k,v| k}
end

#------------------------

def occurrences(str)
  str.scan(/\w+/).inject(Hash.new(0))  do |build, word|
    build[word.downcase] += 1
    build
  end
end

#------------------

class Island
  def initialize(candidates)
    @candidates =  candidates
  end
  
  def survive?
    @candidates.none? {|c| c == "Esau"}
  end
  
  def safe?
    @candidates.all? {|c| c == "Jack"}
  end

end

#---------------------
#Array operators:
#The | (pipe character) is the Union operator.
#The & operator is the Intersection operator.
#The - method preserves even the duplicate elements in the original array, 
# however all occurence of each element in second array are removed from the result - 
# including the duplicates.

class Order
  GIFT_ITEMS = [Item.new(:big_white_tshirt), Item.new(:awesome_stickers)]
  OUT_OF_STOCK_ITEMS = [Item.new(:ssd_harddisk)]

  def initialize(order)
    @order = order || []        
  end
  
  def final_order
    # fix this method to get the tests to pass.
    (@order - OUT_OF_STOCK_ITEMS) + GIFT_ITEMS
  end
end

customer_order = Order.new([Item.new(:fancy_bag),Item.new(:ssd_harddisk)])

p customer_order.final_order

#-----------------------------

class FibonacciNumbers
  NUMBERS = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    
	def each
      NUMBERS.each {|n| yield(n)}
  end
end

f=FibonacciNumbers.new
f.each do |fibonacci_number|
  puts "A Fibonacci number multiplied by 10: #{fibonacci_number*10}"
end

#-----------------------------

class FibonacciNumbers
  
  NUMBERS = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

  def select(&filtering_condition_block)
    filtered_result = []
    NUMBERS.each do |number|
      filtered_result << number if filtering_condition_block.call(number)
    end
    filtered_result
  end

end

# print only the even Fibonacci numbers
nums = FibonacciNumbers.new
nums.select {|num| num % 2 == 0}.each {|num| puts num}

#-----------------

class FibonacciNumbers
	NUMBERS = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
  
  # all your code goes here
  include Enumerable
  def each
    NUMBERS.each {|n| yield(n)}
  end
end

f = FibonacciNumbers.new
if f.respond_to?(:map)
  squares = f.map {|number| number * number }
	puts "The squares of the fibonacci numbers are #{squares}"
else
  puts "I'll reveal the squares to you once you pass the tests."
end

#----------------------

a = "tom"
b = "jerry"
superheroes = [a,b]

# your code here.
b.sub!("jerry", "batman")
puts superheroes

#-------------------------

def describe(user_info)
  #p user_info
  #user_info.inject([])! {|k, v| v}
  p user_info
  "My name is #{user_info.values[0]} and I'm #{user_info.values[1]} years old."
end

p describe({"name"=>"Greg Lief", "age"=>42})

#----------------------

class VisualAcuity
  def initialize(subject, normal)
    #p "subject, normal"
    #p subject, normal
    @subject = subject.to_f
    @normal = normal.to_f  
  end
  
  def self.included(base)
    base.extend(ClassMethod)
  end
  
  def can_drive?
    (@subject / @normal) >= 0.5
  end 
end

class DrivingLicenseAuthority
  def initialize(name, age, visual_acuity)
    #p "name, age, visual"
    p name, age, visual_acuity
    @name = name
    @age = age
    @can_drive = visual_acuity.can_drive?
    #p @can_drive
  end

  def valid_for_license?
    @age >= 18
  end
  
  def verdict
    if @can_drive && valid_for_license?
	    "#{@name} can be granted driving license"
    else
      "#{@name} cannot be granted driving license"
    end
  end
end

#---------------------

# rememeber to require logger.
require 'logger'
class Order
  def initialize(order_items, customer)
    @order_items = order_items
    @customer = customer
    @state = :new
    @logger = Logger.new($STDOUT)
    @logger.level = Logger::INFO
    @logger.info("New order from #{@customer}")
  end

  def procure(vendor)
    if @state == :new
	    @vendor = vendor
	    @state = :procured
      @logger.info( "Order procured from #{@vendor}")
    else
      @logger.error("You have to procure new order.")
    end
  end

  def pack
    if @state == :procured
	    @state = :packed
      @logger.info("order packed")
    else
      @logger.error("You have to procure before packing")
    end
  end

  def ship(address)
    if @state == :packed
	    @state = :shipped
	    @shipping_address = address
      @logger.info("Oorder shipped to #{@shipping_address}")
    else
      @logger.error("You have to pack before ship")
    end
  end
end

order = Order.new(["mouse", "keyboard"], "Asta")
order.procure("Awesome Supplier")
order.pack
order.ship("The Restaurant, End of the Universe")

#-------------------------------

def benchmark
  # your code here!
  begin_time = Time.now
  yield
  end_time = Time.now
  return end_time - begin_time
end

time_taken = benchmark do
  sleep 0.1
end
puts "Time taken #{time_taken}"


#--------------------------
#Here is an exercise that you can solve using the class method. I have a couple 
#of dishes - Soup, IceCream and ChineseGreenBeans (yum!). Objects of these classes 
#can be added to the DeliveryTray.The DeliveryTray has to keep track of the number of 
#dish of each type and suggest how many dishes it needs to carry.

class Dish
end

class Soup < Dish
end
class IceCream < Dish
end
class ChineseGreenBeans < Dish
end

class DeliveryTray
  
  DISH_BOWL_MAPPING = { 
    Soup => "soup bowl",
    IceCream => "ice cream bowl",
    ChineseGreenBeans => "serving plate"
  }
  
  def initialize
    @dishes_needed = {}
  end
  
  def add(dish)
    dish_bowl = DISH_BOWL_MAPPING[dish.class]
    @dishes_needed[dish_bowl] = (@dishes_needed[dish_bowl] || 0) + 1
    
  end
  
  def dishes_needed
    return "None." if @dishes_needed.empty?
    @dishes_needed.map {|bowl, num| "#{num} #{bowl}"}.join(", ") 
  end
end  

d = DeliveryTray.new
d.add Soup.new; d.add Soup.new
d.add IceCream.new

puts d.dishes_needed # should be "2 soup bowl, 1 ice cream bowl"

#------------------------------------
#Now can you implement a method superclasses inside Object that returns this class 
#hierarchy information? The method has to return an array that lists the superclasses 
#of the current object.
class Object
  def superclasses(klass=self.superclass)
    # your code here
    return [] if klass.nil?
      [klass] + superclasses(klass.superclass)
  end
end

class Bar
end

class Foo < Bar
end

p Foo.superclasses  # should be [Bar, Object, BasicObject]

#---------------------------------

class Object
  def singleton_method?(method)
     # your code here
    singleton_methods = self.singleton_class.instance_methods - self.class.instance_methods
      singleton_methods.include? method
  end
end

foo = "A string"
def foo.shout
  puts foo.upcase
end

# shout is a singleton method.
p foo.singleton_method?(:shout)

#-------------------------

class Object
  def frozen_clone
    # your code here
    self.clone.freeze
  end
end


#--------------







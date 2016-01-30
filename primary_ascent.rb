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






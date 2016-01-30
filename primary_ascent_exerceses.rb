#Problem Statement
#Every object in Ruby has at least one parent class. But most objects typically inherit 
#from multiple classes and mixes in various modules. These classes and modules together 
#forms the inheritance hierarchy of the object. The methods added to an object by a class/module 
#an however be overriden by others which are below them in the inheritance chain.

def location_in_hierarchy(object, method)
  # Your code here
     klass = object.class
     ancesters = [klass]
       while  !(superclass = klass.superclass).nil?
       ancesters << superclass
       klass = superclass
     end
     
       ancesters.reverse.find do |a|
         a.instance_methods.include? method
     end 
end

#Problem Statement
#Compute the sum of cubes for a given range a through b.

def sum_of_cubes(a, b)
  # Write your code here
  (a..b).inject(0) {|sum, i| sum + i ** 3}
  
end


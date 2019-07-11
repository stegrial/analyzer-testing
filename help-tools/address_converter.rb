address = "/*[1]/*[2]/*[8]/*[2]/*[1]/*[2]/*[2]/*[1]/*[1]/*[8]"

  # array = address.split(".")
  # for i in array
  # print "/*[#{i.to_i + 1}]"
  # end

  array = address.split("/*[")
  for i in array
    next if i == array[0]
    print "#{(i[0...-1]).to_i - 1}."
  end


# Test

module Test
  CONST = 'I am constanta'
  def Test.demo_1
    puts 'Hello'
  end

  def demo_2
    puts 'WTF'
  end
end

class Class_1
  include Test
  def const
    p CONST
  end
end

class Class_2
  extend Test
  def const
    p CONST
  end
end

# include Test
# extend Test

# Class_1.new.demo_2 # WTF
# Class_1.new.demo_1 # undefined method `demo_1' for #<Class_1:0x00007f9b3b8d5a58>
# Class_1.new.const # WTF
# Class_1.demo_2 # undefined method `demo_2' for Class_1:Class
# Class_1.demo_1 # undefined method `demo_1' for Class_1:Class

# Class_2.new.demo_2 # undefined method `demo_2' for #<Class_2:0x00007f99958a9838>
# Class_2.new.demo_1 # undefined method `demo_1' for #<Class_2:0x00007fa2268e2ea0>
# Class_2.new.const # uninitialized constant Class_2::CONST
# Class_2.demo_2 # WTF
# Class_2.demo_1 # undefined method `demo_1' for Class_2:Class

# Test.demo_1 # Hello
# Test.demo_2 # undefined method `demo_2' for Test:Module

# demo_1 # undefined local variable or method `demo_1' for main:Object
# demo_2 # undefined local variable or method `demo_2' for main:Object

# p CONST # uninitialized constant CONST
# p Test::CONST # I am constanta

# include Test

# Class_1.demo_2 # undefined method `demo_2' for Class_1:Class => WTF
# Class_2.new.demo_2 # undefined method `demo_2' for #<Class_2:0x00007f99958a9838> => WTF
# Test.demo_2 # undefined method `demo_2' for Test:Module => WTF
# demo_2 # undefined local variable or method `demo_2' for main:Object => WTF
# p CONST # uninitialized constant CONST => I am constanta

# extend Test

# demo_2 # undefined local variable or method `demo_2' for main:Object => WTF
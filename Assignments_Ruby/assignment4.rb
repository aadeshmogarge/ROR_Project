class ArrayError < StandardError
  def initialize(msg)
      super(msg)
  end
end
def even_numbers(num)
  if(num.length() == 0)
      raise ArrayError.new("Array can't be empty \n the input provided was #{num}")
  elsif(num.class != Array)
      raise ArrayError.new("Provided attribute is not an array \n the input provided was #{num}")
  elsif(!check_even? num)
      raise ArrayError.new("Provided array does not have any even number \n the input provided was #{num}")
  else
      puts "given input #{num} satisfies the all conditions"
  end
end
def check_even?(arr)
  arr.each{
      |i|
      # if(i % 2 == 0)
      #     return true
      # end
      if(i.even?)
          return true
      end
  }
  return false
end
# even_numbers([])
# even_numbers("sa")
even_numbers([2,3,7])
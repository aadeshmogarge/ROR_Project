class String
  def split(delimeter= " ")
      str = self
      index = str.index(delimeter)
      return str if index.nil?
      arr = Array.new
      arr << str.slice(0, index) << str.slice(index+1, length).split(delimeter)
      return arr.flatten
  end
end
str = "DassaultSystem"
p str.split
str2 = "Dassault*System"
p str2.split("*")
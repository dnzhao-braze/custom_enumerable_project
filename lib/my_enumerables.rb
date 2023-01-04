module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0...self.length
      yield(self[i], i)
    end
    self
  end

  def my_select
    result = []
    for e in self
      if yield(e)
        result << e
      end
    end
    result
  end

  def my_all?
    for e in self
      unless yield(e)
        return false
      end
    end
    return true
  end

  def my_any?
    for e in self
      if yield(e)
        return true
      end
    end
    return false
  end

  def my_none?
    for e in self
      if yield(e)
        return false
      end
    end
    return true
  end

  def my_count
    if block_given?
      count = 0
      for e in self
        if yield(e)
          count += 1
        end
      end
      count
    else
      self.length
    end
  end

  def my_map
    result = []
    for e in self
      result << yield(e)
    end
    result
  end

  def my_inject(val)
    for e in self
      val = yield(val, e)
    end
    val
  end

end

#Enumerable#my_inject	spec/my_inject_spec.rb

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for e in self
      yield(e)
    end
    self
  end
end

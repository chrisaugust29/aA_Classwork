class MaxIntSet
  attr_accessor :store
  def initialize(max) #5 
    @store = Array.new(max, false) 
  end

  def insert(num)
    if validate!(num) && !include?(num)
    self.store[num] = true 
    return true
   end
   return false 
  end

  def remove(num)
    self.store[num] = false if validate!(num) && include?(num)
    end

  def include?(num)
      validate!(num) && @store[num] 
  end

  private

  def is_valid?(num)
    num > 0 && num < @store.length
  end

  def validate!(num)
     if !is_valid?(num)
      raise "Out of bounds"
      return false 
      end
      true 
  end

end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end

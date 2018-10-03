class Array

  def my_uniq
    result = []

    self.each do |e|
      result << e unless result.include?(e)
    end
    result
  end


  def two_sum
    result = []
    self.each.with_index do |e, i|
      neg = e * -1
      i2 = 0
      while i2 < self.length
        if i2 != i && self[i2] == neg
          result << [i,i2] unless result.include?([i,i2]) || result.include?([i2,i])
        end
        i2 += 1
      end
    end

    result
  end

  def my_transpose
    result = Array.new (self.first.length) {Array.new (length)}

    i = 0
    while i < length
      j = 0
      while j < self.first.length
        result[j][i] = self[i][j]
        j += 1
      end
      i += 1
    end
    result
  end

end


def stock_picker(arr)
  hash = Hash.new

  arr.each_with_index do |e,i|

    arr.each_with_index do |e2, i2|
      hash[[i,i2]] = e2 - e unless i > i2 || i == i2
    end
  end

  hash.sort_by {|k,v| v}.last.first
end

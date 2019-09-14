class Array

  def two_sum
    two_sums = []
    self.each_with_index do |el1, i|
      self.each_with_index do |el2, j|
        if i < j && el1 + el2 == 0
          two_sums << [i, j]
        end
      end
    end
    two_sums
  end

end
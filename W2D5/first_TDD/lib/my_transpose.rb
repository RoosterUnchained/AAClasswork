def my_transpose(arr)
  transposed = Array.new(arr.length) {Array.new()}
   i = 0
   while i < arr.length 
    arr.each do |el| 
      transposed[i] << el[i]
    end
    i += 1 
  end
  transposed
end

# def my_transpose(arr)
#   transposed = Array.new(arr.length) {Array.new(arr.length)}
#   arr.each_index do |i|
#     arr.each_index do |j|
#       transposed[j][i] = arr[i][j]
#     end
#   end
#   transposed
# end



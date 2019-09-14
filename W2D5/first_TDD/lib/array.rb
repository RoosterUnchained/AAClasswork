def my_unique(arr)
  unique = []
  arr.each do |el|
    if !unique.include?(el)
      unique << el 
    end
  end
  unique
end
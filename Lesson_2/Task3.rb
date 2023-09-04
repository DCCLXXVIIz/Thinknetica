arr1 = [0,1]
index = 1

while arr1[index]+arr1[index-1] <= 100 do
  arr1.push(arr1[index]+arr1[index-1])
  index += 1
end
puts arr1

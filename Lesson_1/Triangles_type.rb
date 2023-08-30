puts "Ente the length of the first side in sm"
first_s = gets.to_f

puts "Ente the length of the second side in sm"
second_s = gets.to_f

puts "Ente the length of the third side in sm"
third_s = gets.to_f

if first_s==second_s && second_s==third_s
  puts "Equilateral triangle"
  elsif first_s == second_s || second_s == third_s || first_s == third_s
    puts "Isosceles triangle"
  elsif first_s**2==second_s**2+third_s**2 || second_s**2==first_s**2+third_s**2 || third_s**2 == first_s**2+second_s**2
    puts "Right triangle"
  else
    puts "Triangle"
end

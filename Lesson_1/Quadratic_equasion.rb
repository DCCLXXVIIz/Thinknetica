puts "Enter the coefficient a"
a = gets.to_f

puts "Enter the coefficient b"
b = gets.to_f

puts "Enter the coefficient c"
c = gets.to_f
d = b**2-4*a*c
if c==0


end

if d < 0
  puts "Действительных корней нет"
else
  x1 = (b*(-1) + Math.sqrt(d))/(2*a)
  if d == 0
    puts "Дискриминант равен #{d}, корень #{x1}"
    else
      x2 = (b*(-1) - Math.sqrt(d))/(2*a)
      puts "Дискриминант равен #{d}, первый корень#{x1}, второй корень #{x2}"
    end

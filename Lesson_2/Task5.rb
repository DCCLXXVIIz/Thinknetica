puts "Введите день"
day = gets.to_i
puts "Введите месяц"
month = gets.to_i
puts "Введите год"
year = gets.to_i
days=0

months_day = [day,31,28,31,30,31,30,31,31,30,31,30]
if year % 4 == 0 || (year % 100 == 0 && year % 400 == 0)
  months_day[2] += 1
end

for i in (0...month)
  days += months_day[i]
end
puts days

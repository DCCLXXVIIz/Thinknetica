check = {}
summ = 0
while true
  puts "Введите назвввние тоара"
  name = gets.chop
  if name == "стоп" || name == "stop"
    break
  end
  puts "Введите цену товара"
  price = gets.to_f
  puts "Введите количество товара"
  quantity = gets.to_f
  check[name] = {price => quantity}
end

check.each do |key, value|
    puts "Название товара: #{key} Количество товара: #{value.values[0]} Цена за единицу: #{value.keys[0]} Всего: #{value.keys[0]*value.values[0]}"
    summ += value.keys[0]*value.values[0]
  end
puts "Сумма покупок составляет #{summ}"

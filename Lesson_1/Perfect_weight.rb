puts "Type your name"
name = gets.chomp.capitalize

puts "Type your height"
height = gets.chomp.to_f

perfect_weight = (height - 110) * 1.15

if(perfect_weight >= 0)
    puts "#{name} your perfect weight is #{perfect_weight}"
else
    puts "#{name} your weight is already optimal"
    #Возможно стоило сравнивать текущий вес человека с весом идеальным. Иначе выходит, что для идеального веса необходимо быть ростом 109 см.
end

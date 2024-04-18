require_relative 'railroad'
main_railroad = Railroad.new
while 1 == 1
  puts "Enter a value between 1 and 8 in the field: \n
  1. Create a station \n
  2. Create trains \n
  3. Create routes and manage stations in it (add, delete) \n
  4. Assign a route to a train \n
  5. Carriages' management \n
  6. Move the train forward and backward along the route \n
  7. View the list of stations and the list of trains at a station \n
  0. Exit"
  number = gets.to_i
  break if number == 0
  main_railroad.menu(number)
end

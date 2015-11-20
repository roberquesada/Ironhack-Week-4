# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first_name = ['Jose', 'Antonio', 'Jessica', 'Raul', 'Ana', 'Carlos', 'Gonzalo', 'Mercedes', 'Laura', 'Patrica', 'Jose', 'Roberto']
last_name = ['Gutierrez', 'Velazquez', 'Quesada', 'Lizana', 'Pérez', 'Vega', 'De La Fuente', 'Sanchez', 'Suarez', 'Machado', 'Puertadura', 'Memeo']


50.times do |i|
  random1 = rand(0..11)
  random2 = rand(0..11)
  User.create(name: "#{first_name[random1]} #{last_name[random2]}", email: "email@test#{i}.com")
end

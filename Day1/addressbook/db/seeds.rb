# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do |i|
  Contact.create(
    name: "Name #{i}",
    address: "Calle pipitrolo Nº#{i}",
    phone: "666666666",
    email: "test@test.com"
  )
end

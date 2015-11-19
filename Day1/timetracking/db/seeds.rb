# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


25.times do |i|

  project = Project.create(
  name: "Project #{i+1}",
  description: "Description #{i+1}"
  )

  Entry.create(
  project_id: rand(1..25),
  hours: rand(0..4),
  minutes: rand(0..59),
  comments: "Test description for #{project.name}"
  )
end

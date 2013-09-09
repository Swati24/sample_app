# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
["admin", "reporter", "editor"].each do |value|
	user = User.create(name: value.capitalize, email: "#{value}@sample.com", password: "testing", role: value)
end

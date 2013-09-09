# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'feedzirra'

user = User.create(name: "Admin", email: "admin@sample.com", password: "testing", role: "admin")
user = User.create(name: "Editor", email: "editor@sample.com", password: "testing", role: "editor")
user = User.create(name: "Reporter", email: "reporter@sample.com", password: "testing", role: "reporter")

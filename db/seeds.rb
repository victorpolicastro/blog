# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(title: "Programação").save!
Category.create(title: "Ruby").save!
Category.create(title: "Rails").save!
User.create(name: 'admin', last_name: 'admin', email: 'admin@blog.com', password: 'admin1', admin: true).save!
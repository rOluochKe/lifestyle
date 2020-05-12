# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

Category.create!([{
  category: "Fashion",
  priority: "High"
},
{
  category: "Business",
  priority: "Low"
},
{
  category: "Sports",
  priority: "High"
},
{
  category: "Entertainment",
  priority: "Moderate"
},
{
  category: "Magazine",
  priority: "Low"
},
{
  category: "TV",
  priority: "Moderate"
}])

p "Created #{Category.count} categories"
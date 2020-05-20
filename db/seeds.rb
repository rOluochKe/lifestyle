# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

image_data = File.open(File.join(Rails.root,'app/assets/images/raymond.jpeg'))

User.destroy_all

User.create!([{
  email: "mike@gmail.com",
  name: "Mike John",
  password: "123456",
  image: image_data
},
{
  email: "jane@gmail.com",
  name: "Jane Doe",
  password: "123456",
  image: image_data
},
{
  email: "john@gmail.com",
  name: "John Doe",
  password: "123456",
  image: image_data
}
])

p "Created #{User.count} users"

Article.destroy_all

Article.create!([{
  title: "The user is presented one",
  content: "Featured article with full-width image and title in the first row. This should be an article with the biggest number of votes. Skip the carousel widget and weather and city information.",
  image: "https://images.pexels.com/photos/956999/milky-way-starry-sky-night-sky-star-956999.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  user_id: 1,
  category_id: 1
},
{
  title: "The user is presented two",
  content: "Featured article with full-width image and title in the first row. This should be an article with the biggest number of votes. Skip the carousel widget and weather and city information.",
  image: "https://images.pexels.com/photos/3780681/pexels-photo-3780681.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  user_id: 2,
  category_id: 2
},
{
  title: "The user is presented three",
  content: "Featured article with full-width image and title in the first row. This should be an article with the biggest number of votes. Skip the carousel widget and weather and city information.",
  image: "https://images.pexels.com/photos/965875/pexels-photo-965875.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  user_id: 3,
  category_id: 3
},
{
  title: "The user is presented four",
  content: "Featured article with full-width image and title in the first row. This should be an article with the biggest number of votes. Skip the carousel widget and weather and city information.",
  image: "https://images.pexels.com/photos/1722196/pexels-photo-1722196.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  user_id: 1,
  category_id: 1
},
{
  title: "The user is presented five",
  content: "Featured article with full-width image and title in the first row. This should be an article with the biggest number of votes. Skip the carousel widget and weather and city information.",
  image: "https://images.pexels.com/photos/4100130/pexels-photo-4100130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  user_id: 2,
  category_id: 2
},
{
  title: "The user is presented six",
  content: "Featured article with full-width image and title in the first row. This should be an article with the biggest number of votes. Skip the carousel widget and weather and city information.",
  image: "https://images.pexels.com/photos/2081499/pexels-photo-2081499.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  user_id: 3,
  category_id: 3
},
{
  title: "The user is presented seven",
  content: "Featured article with full-width image and title in the first row. This should be an article with the biggest number of votes. Skip the carousel widget and weather and city information.",
  image: "https://images.pexels.com/photos/531321/pexels-photo-531321.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  user_id: 1,
  category_id: 4
},
{
  title: "The user is presented eight",
  content: "Featured article with full-width image and title in the first row. This should be an article with the biggest number of votes. Skip the carousel widget and weather and city information.",
  image: "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  user_id: 3,
  category_id: 4
}
])

p "Created #{Article.count} articles"

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
}
])

p "Created #{Category.count} categories"

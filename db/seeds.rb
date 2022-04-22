# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#create User
# 20.times do
#     name = Faker::Name.unique.name
#     UserChart.create(user_name: name)
# end
# #create active time
# 20.times do
#     user_id = Faker::Number.between(from: 1, to: 10)
#     post_activetime = Faker::Time.backward(days: 90, period: :all) 
#     ActiveChart.create(user_id: user_id, post_activetime: post_activetime)
# end

# 20.times do
#     user_id = Faker::Number.between(from: 1, to: 10)
#     comment_activetime = Faker::Time.backward(days: 90, period: :all) 
#     ActiveChart.create(user_id: user_id, comment_activetime: comment_activetime)
# end

email = Faker::Internet.email
password = "abc123"
Admin.create(email: email, password: password)

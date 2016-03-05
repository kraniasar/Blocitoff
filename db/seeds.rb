require 'faker'


10.times do
  user = User.new(
      email:    Faker::Internet.email,
      password: Faker::Lorem.characters(10)
    )
    
    user.save!
end

users = User.all


20.times do
  Item.create!(
      user: users.sample,
      name: Faker::Lorem.sentence
      )
end

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"

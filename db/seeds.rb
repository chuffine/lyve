User.create!(full_name: "Example User",
             username: "example_user",
             email: "user@example.com",
             password:  "foobar123",
             password_confirmation: "foobar123",
)

99.times do |n|
  name = Faker::Name.name
  username = "example_#{n}"
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(full_name: name,
               username: username,
               email: email,
               password:
                   password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end

# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# Create channels
user = User.find(1)
#user.channels.create!(channel_name: "News")
#user.channels.create!(channel_name: "Sports")
#user.channels.create!(channel_name: "Humor")
#user.channels.create!(channel_name: "Facts")

# Seed subscriptions
users = User.all
user = users.first
channels = user.channels
channel = channels.first
subscribing = users[2..10]
subscribing.each { |subscribed| channel.subscribe(subscribed) }
# Moderator One
user_one = User.create(username: 'Anna', email: 'anna@test.com', about_me: "I am brat", password: 'password', password_confirmation: 'password')
moderator_one = Moderator.create(user_id: user_one.id)

# Moderator Two
user_two = User.create(username: 'Chris', email: 'chris@test.com', about_me: "I am a massive brat", password: 'password', password_confirmation: 'password')
moderator_twp = Moderator.create(user_id: user_two.id)

# Standard User
user_three = User.create(username: 'Bube', email: 'bube@test.com', about_me: "I am a massive brat", password: 'password', password_confirmation: 'password')
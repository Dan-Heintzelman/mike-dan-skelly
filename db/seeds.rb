require 'faker'

dan = User.create!(username: "dheintz", password: "password")
michael = User.create!(username: "yao", password: "password")
sandra = User.create!(username: "sandra", password: "password")

10.times do 
	User.create!(username: Faker::Name.name, password: "password")
end	





















# Sample Seeds



# 50.times do
# 	Post.create!(
# 		title: Faker::Hipster.sentence, 
# 		article_url: Faker::Internet.url,
# 		user: User.find(rand(1...13))
# 		) 
# end


# 100.times do
# 	Comment.create!(text: Faker::Hacker.say_something_smart,
# 		post: Post.find(rand(1...50)),
# 		user: User.find(rand(1...13))
# 	)
# end
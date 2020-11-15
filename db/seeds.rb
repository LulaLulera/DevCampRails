# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |topic|
	Topic.create!(
		title: "Topic#{topic}"
	)
end

puts "13 topics created"

10.times do |blog|
	Blog.create!(
		title: "My blog post #{blog}",
		body: "body post",
		topic_id: Topic.last.id
	)
end

puts "10 posts created"


8.times do |portfolio_item|
	Portfolio.create!(
		title: "Portfolio #{portfolio_item}",
		subtitle: "Ruby on rails",
		body: "Lorem ipsum lorem ipsum",
		main_image: "http://placehold.it/600x400",
		thumb_image: "http://placehold.it/350x200"
	)
end


1.times do |portfolio_item|
	Portfolio.create!(
		title: "Portfolio #{portfolio_item}",
		subtitle: "Angular",
		body: "Lorem ipsum lorem ipsum",
		main_image: "http://placehold.it/600x400",
		thumb_image: "http://placehold.it/350x200"
	)
end

puts "9 portfolio items created"


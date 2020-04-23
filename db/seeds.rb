require 'faker'

puts 'Cleaning database ...'
User.destroy_all

puts 'Creating Users ...'
a = User.create(first_name: "Jane", last_name: "Austen", email: "janeaustin@gmail.com")
b = User.create(first_name: "Winston", last_name: "Churchill", email: "winstonchurchill@gmail.com")
c = User.create(first_name: "Barack", last_name: "Obama", email: "barackobama@gmail.com")
d = User.create(first_name: "Christopher", last_name: "Hand", email: "colonelnasty32@gmail.com")
e = User.create(first_name: "Kaylin", last_name: "Bittner", email: "kaylinbittner@gmail.com")

puts 'Creating Offers ...'

f = Offer.create(user: a, title: Faker::TvShows::RickAndMorty.location, description: Faker::TvShows::RickAndMorty.quote, picture: "https://unsplash.it/300/200?random")
g = Offer.create(user: b, title: Faker::TvShows::RickAndMorty.location, description: Faker::TvShows::RickAndMorty.quote, picture: "https://unsplash.it/300/200?random")
h = Offer.create(user: c, title: Faker::TvShows::RickAndMorty.location, description: Faker::TvShows::RickAndMorty.quote, picture: "https://unsplash.it/300/200?random")
i = Offer.create(user: d, title: Faker::TvShows::RickAndMorty.location, description: Faker::TvShows::RickAndMorty.quote, picture: "https://unsplash.it/300/200?random")
j = Offer.create(user: e, title: Faker::TvShows::RickAndMorty.location, description: Faker::TvShows::RickAndMorty.quote, picture: "https://unsplash.it/300/200?random")

puts 'Creating Requests ...'
k = Request.create(user: a, offer: g, title: Faker::TvShows::RickAndMorty.location, description: Faker::TvShows::RickAndMorty.quote)
l = Request.create(user: b, offer: h, title: Faker::TvShows::RickAndMorty.location, description: Faker::TvShows::RickAndMorty.quote)
m = Request.create(user: c, offer: i, title: Faker::TvShows::RickAndMorty.location, description: Faker::TvShows::RickAndMorty.quote)
n = Request.create(user: d, offer: j, title: Faker::TvShows::RickAndMorty.location, description: Faker::TvShows::RickAndMorty.quote)
o = Request.create(user: e, offer: f, title: Faker::TvShows::RickAndMorty.location, description: Faker::TvShows::RickAndMorty.quote)

puts 'Your Database Seeded!'
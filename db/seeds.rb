require 'json'
require 'open-uri'
key1 = 'apikey=a7b874e'
key2 = 'apikey=83c06c69'
key3 = 'apikey=249b1617'

puts 'Deleting all movies'
Review.destroy_all
Renting.destroy_all
Movie.destroy_all
User.destroy_all

puts "Create User"
alexandre = User.create!(email: "alex@attila.com" , password: "azerty", username: 'Alex', avatar: 'alexAvatar.jpg')
william = User.create!(email: "will@attila.com" , password: "azerty", username: 'William', avatar: 'williamAvatar.jpeg')
alice =  User.create!(email: "alice@attila.com" , password: "azerty", username: 'Alice', avatar: 'aliceAvatar.png')

puts 'Seeding movies without cover'
movies = []
movies << Movie.new(
  {
    title: "The Game",
    release_date: 1997,
    duration: '108 min',
    description: "After a wealthy banker is given an opportunity to participate in a mysterious game, his life is turned upside down when he becomes unable to distinguish between the game and reality.",
    category: "Thriller",
    director: "David Fincher",
    price: [3, 4, 5].sample,
    rating: 7.8,
    nb_rates: 1 + rand(9),
    user: alexandre
  })

movies << Movie.new(
  {
    title: "Boogie Nights",
    release_date: 1997,
    duration: '93 min',
    description: "The story of a young man's adventures in the California pornography industry of the late 1970s and early 1980s.",
    category: "Adventure",
    director: "Paul Thomas Anderson",
    price: [3, 4, 5].sample,
    rating: 7.9,
    nb_rates: 1 + rand(9),
    user: william
  })

movies << Movie.new(
  {
    title: "Les Invasions Barbares",
    release_date: 2003,
    duration: '137 min',
    description: "During his final days, a dying man is reunited with old friends, former lovers, his ex-wife, and his estranged son.",
    category: "History",
    director: "Denys Arcand",
    price: [3, 4, 5].sample,
    rating: 7.7,
    nb_rates: 1 + rand(9),
    user: alice
  })


cover_urls = ["https://res.cloudinary.com/dvtjorjay/image/upload/v1543316511/e4dqfucife0mv6m5agag.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1543316383/avny0dxavadjauwhufgc.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1543316528/a5kvvuts95mt1rjggbtc.jpg"]

puts 'Adding cover and saving'
movies.each_with_index do |movie, index|
  movies[index].remote_cover_url = cover_urls[index]
  movie.save
end

puts 'IMDB'

list_movies1 = ['Die Hard','Harry Potter', 'Bohemian Rhapsody', 'Halloween', 'William & Kate','Rambo', 'Dikkenek','King Kong', 'Aladin', 'Bambi']
list_movies1.each do |movie|
  puts movie
  url = "http://www.omdbapi.com/?t=#{movie}&#{key1}"
  movie_serialized = open(url).read
  movie_hash = JSON.parse(movie_serialized)
  new_movie = Movie.create(
    {
      title: movie_hash['Title'],
      release_date: movie_hash['Year'],
      duration: movie_hash['Runtime'],
      description: movie_hash['Plot'],
      category: movie_hash['Genre'],
      director: movie_hash['Director'],
      price: [3, 4, 5].sample,
      rating: movie_hash['imdbRating'],
      nb_rates: 1 + rand(9),
      user: alice
    })
  new_movie.remote_cover_url = movie_hash['Poster']
  new_movie.save
end

sleep(120)

list_movies2 = ['Toy Story','La verite si je mens', 'The Fall','Dumbo','Creed', 'Love Actually', 'Black Panther','Jumanji', 'The Dark knight', 'Pulp Fiction']
list_movies2.each do |movie|
  puts movie
  url = "http://www.omdbapi.com/?t=#{movie}&#{key2}"
  movie_serialized = open(url).read
  movie_hash = JSON.parse(movie_serialized)
  new_movie = Movie.create(
    {
      title: movie_hash['Title'],
      release_date: movie_hash['Year'],
      duration: movie_hash['Runtime'],
      description: movie_hash['Plot'],
      category: movie_hash['Genre'],
      director: movie_hash['Director'],
      price: [3, 4, 5].sample,
      rating: movie_hash['imdbRating'],
      nb_rates: 1 + rand(9),
      user: alexandre
    })
  new_movie.remote_cover_url = movie_hash['Poster']
  new_movie.save
end

sleep(120)

list_movies3 = ['Inception', 'GoodFellas', 'The pianist', 'The departed', 'Whiplash', 'Gladiator', 'Alien', 'Django Unchained','Coco']
list_movies3.each do |movie|
  puts movie
  url = "http://www.omdbapi.com/?t=#{movie}&#{key3}"
  movie_serialized = open(url).read
  movie_hash = JSON.parse(movie_serialized)
  new_movie = Movie.create(
    {
      title: movie_hash['Title'],
      release_date: movie_hash['Year'],
      duration: movie_hash['Runtime'],
      description: movie_hash['Plot'],
      category: movie_hash['Genre'],
      director: movie_hash['Director'],
      price: [3, 4, 5].sample,
      rating: movie_hash['imdbRating'],
      nb_rates: 1 + rand(9),
      user: william
    })
  new_movie.remote_cover_url = movie_hash['Poster']
  new_movie.save
end

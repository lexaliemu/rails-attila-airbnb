require 'json'
require 'open-uri'
key = 'apikey=a7b874e'

puts 'Deleting all movies'
Movie.destroy_all
User.destroy_all

puts "Create User"
alexandre = User.create!(email: "alex@attila.com" , password: "azerty")
william = User.create!(email: "will@attila.com" , password: "azerty")
alice =  User.create!(email: "alice@attila.com" , password: "azerty")

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
    price: 5.99,
    rating: 7.8,
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
    price: 5.99,
    rating: 7.9,
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
    price: 5.99,
    rating: 7.7,
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

list_movies = ['Die Hard','Harry Potter', 'Bohemian Rhapsody', 'Halloween', 'William & Kate']
list_movies.each do |movie|
  url = "http://www.omdbapi.com/?t=#{movie}&#{key}"
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
      price: 5.99,
      rating: movie_hash['imdbRating'],
      user_id: 1
    })
  new_movie.remote_cover_url = movie_hash['Poster']
  new_movie.save
end

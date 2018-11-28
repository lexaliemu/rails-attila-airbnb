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
    duration: 7740000,
    description: "After a wealthy banker is given an opportunity to participate in a mysterious game, his life is turned upside down when he becomes unable to distinguish between the game and reality.",
    synopsis: "Nicholas Van Orton is a very wealthy San Francisco banker, but he is an absolute loner, even spending his birthday alone. In the year of his 48th birthday (the age his father committed suicide) his brother Conrad, who has gone long ago and surrendered to addictions of all kinds, suddenly returns and gives Nicholas a card giving him entry to unusual entertainment provided by something called Consumer Recreation Services (CRS). Giving in to curiosity, Nicholas visits CRS and all kinds of weird and bad things start to happen to him.",
    director: "David Fincher",
    price: 5.99,
    rating: 7.8,
    user: alexandre
  })

movies << Movie.new(
  {
    title: "Boogie Nights",
    release_date: 1997,
    duration: 9300000,
    description: "The story of a young man's adventures in the California pornography industry of the late 1970s and early 1980s.",
    synopsis: "Adult film director Jack Horner is always on the lookout for new talent and it’s only by chance that he meets Eddie Adams who is working as a busboy in a restaurant. Eddie is young, good looking and plenty of libido to spare. Using the screen name Dirk Diggler, he quickly rises to the top of his industry winning awards year after year. Drugs and ego however come between Dirk and those around him and he soon finds that fame is fleeting.",
    director: "Paul Thomas Anderson",
    price: 5.99,
    rating: 7.9,
    user: william
  })

movies << Movie.new(
  {
    title: "Les Invasions Barbares",
    release_date: 2003,
    duration: 5940000,
    description: "During his final days, a dying man is reunited with old friends, former lovers, his ex-wife, and his estranged son.",
    synopsis: "In this belated sequel to ‘The Decline of the American Empire’, 50-something Montreal college professor, Remy, learns that he is dying of liver cancer. He decides to make amends meet to his friends and family before he dies. He first tries to made peace with his ex-wife Louise, who asks their estranged son Sebastian, a successful businessman living in London, to come home. Sebastian makes the impossible happen, using his contacts and disrupting the entire Canadian system in every way possible to help his father fight his terminal illness to the bitter end, while he also tries to reunite his former friends, Pierre, Alain, Dominique, Diane, and Claude to see their old friend before he passes on.",
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
      duration: 5940000,
      description: movie_hash['Genre'],
      synopsis: movie_hash['Plot'],
      director: movie_hash['Director'],
      price: 5.99,
      rating: movie_hash['imdbRating'],
      user: alice
    })
  new_movie.remote_cover_url = movie_hash['Poster']
  new_movie.save
end

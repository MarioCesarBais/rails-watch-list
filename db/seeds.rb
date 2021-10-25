require 'open-uri'
require 'json'

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
Bookmark.all.each { |bookmark| bookmark.destroy }
Movie.all.each { |movie| movie.destroy } # clean db
List.all.each { |list| list.destroy}

pk = '60eafe836f912585e820d111e226cc54'
url = "http://tmdb.lewagon.com/movie/top_rated?api_key=#{pk}"
movie = URI.open(url).read
%w(Action Comedy Drama Fantasy Horror Mystery Romance Thriller).each { |c| List.create!(name: c) }
list_ids = List.all.ids
JSON.parse(movie)['results'].each { |movie|
  @movie = Movie.new()
  @movie.title = movie['title']
  @movie.overview = movie['overview']
  @movie.poster_url = movie["poster_path"]
  @movie.rating = movie["vote_average"]
  @movie.save!
  rand(3..8).times {
    @bookmark = Bookmark.new
    @bookmark.comment = Faker::Movie.quote
    @bookmark.movie_id = @movie.id
    @bookmark.list_id = list_ids.sample
    @bookmark.save! if @bookmark.valid?
  }
}

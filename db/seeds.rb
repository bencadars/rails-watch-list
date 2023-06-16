# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

puts "Cleaning movie database..."
Movie.destroy_all
List.destroy_all

puts "loading movie database..."

List.create("name": "Classic Movies")
List.create("name": "Actions Movies")
List.create("name": "Comedy")
List.create("name": "My favorite Movies")

url = 'https://tmdb.lewagon.com/movie/top_rated'

response = URI.open(url).read
movies = JSON.parse(response)
movies['results'].each do |movie|
  title = movie['title']
  overview = movie['overview']
  rating = movie['vote_average'].to_i
  poster_url = movie['poster_path']

  Movie.create(
    title: title,
    overview: overview,
    rating: rating,
    poster_url: "https://image.tmdb.org/t/p/w500/#{poster_url}"
  )
end

puts "Finished"

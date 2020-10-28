# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'httparty'

Summary.create(id:1)

def get_countries
	print "Entering\n"
    country_names = []
    base_url = "https://corona.lmao.ninja/v3/covid-19/countries"
    request = HTTParty.get(base_url).body
	print "Getting Corona Link\n"
    response = JSON.parse(request)
	print response
    response.each_with_index do |c, i|
        country_name = response[i]["country"]
        Country.create(country_name: country_name)
    end
end

get_countries
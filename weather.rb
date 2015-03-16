# weather API stuff
require 'rubygems'
require 'yahoo_weatherman'

# get user location
def get_zip
	puts "Please input your zip code."
	zipcode = gets.chomp
end

zipcode = get_zip

today = Time.now.strftime('%w').to_i

# Yahoo gem stuff from the rubydocs example
client = Weatherman::Client.new :unit => 'F'
weather = client.lookup_by_location(zipcode)

# Current temp
temp = weather.condition['temp']
location = weather.location['city'] + ", " + weather.location['region']

puts "It is currently " + temp.to_s + " degrees in " + location.to_s

# Five day forecast
weather.forecasts.each do |forecast|
 
day = forecast['date']
 
weekday = day.strftime('%w').to_i
 
if weekday == today
   dayName = 'Today'
elsif weekday == today + 1
   dayName = 'Tomorrow'
else
   dayName = day.strftime('%A')
end
 
puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s
 
end
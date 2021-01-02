require "open-uri"

puts "Clean database..."

EventRegistration.destroy_all
Event.destroy_all
Location.destroy_all

# FavoriteItinerary.destroy_all
Trip.destroy_all #child of user, user model updated to destroy dependent when user is destroyed.
User.destroy_all #parent (normally child should be destroyed before parent unless specified in model)

# users
puts "Creating users"
user_list = [
{
  email: "user@user.com",
  password: "password",
  first_name: "Sheila",
  last_name: "Leveille",
  username: "sheilz",
  description: "Solo traveller starting an unexpected journey.",
  gender: "Female",
  date_of_birth: "1994-04-09",
  # avatar: "https://res.cloudinary.com/sh19cloud/image/upload/v1560922242/mygbfvn3zy1ou1uvyqe6.jpg"
},
{
  email: "paal@gmail.com",
  password: "password",
  first_name: "Paal",
  last_name: "Ringstad",
  username: "Paal",
  description: "Avid traveller, sailor, and cat enthusiast.",
  gender: "Male",
  date_of_birth: "1989-04-15",
  # avatar: "https://res.cloudinary.com/sh19cloud/image/upload/v1560922303/xl2yycfemge6qmppbxxb.png"
},
{
  email: "sophia.wu@gmail.com",
  password: "password",
  first_name: "Sophia",
  last_name: "Wu",
  username: "sophisophi",
  description: "I like cats, surfings, and cats that surf.",
  gender: "Female",
  date_of_birth: "1994-04-20",
  # avatar: "https://res.cloudinary.com/sh19cloud/image/upload/v1560922099/eomowthx1w6iqrqlxtcl.png"
},
{
  email: "gabby@gmail.com",
  password: "password",
  first_name: "Gabriel",
  last_name: "Z",
  username: "gabby",
  description: "Traveller from Argentina who loves penguins. St. Kilda's are so cute!",
  gender: "Male",
  date_of_birth: "1991-04-09",
  # avatar: "gabby.jpg"
}]

User.create!(user_list)
puts "Created #{User.count} user(s)"

# activities
# puts "Creating tags"
# tag_list = [
# {
#   tag_name: "I'm on a Boat"
# },
# {
#   tag_name: "History"
# },
# {
#   tag_name: "Night Life"
# },
# {
#   tag_name: "Swimming"
# },
# {
#   tag_name: "Mountains"
# },
# {
#   tag_name: "Hiking"
# },
# {
#   tag_name: "Markets"
# },
# {
#   tag_name: "Fashion"
# },
# {
#   tag_name: "Style"
# },
# {
#   tag_name: "Education"
# },
# {
#   tag_name: "Great Outdoors"
# },
# {
#   tag_name: "Adventure"
# },
# {
#   tag_name: "Foodie"
# },
# {
#   tag_name: "Nature"
# },
# {
#   tag_name: "Long Walks"
# },
# {
#   tag_name: "Water Activities"
# },
# {
#   tag_name: "Exploration"
# },
# {
#   tag_name: "Indoors"
# },
# {
#   tag_name: "Photography"
# },
# {
#   tag_name: "Off the Beaten Track"
# },
# {
#   tag_name: "South America"
# },
# {
#   tag_name: "North America"
# },
# {
#   tag_name: "Asia"
# },
# {
#   tag_name: "Africa"
# },
# {
#   tag_name: "Europe"
# },
# {
#   tag_name: "Pacific"
# },
# {
#   tag_name: "Middle East"
# },
# {
#   tag_name: "Latin America"
# },
# {
#   tag_name: "Animal Sightings"
# },
# {
#   tag_name: "Artsy"
# },
# {
#   tag_name: "Fancy"
# },
# {
#   tag_name: "Budget Friendly"
# },
# {
#   tag_name: "Drinks"
# },
# {
#   tag_name: "Techy"
# },
# {
#   tag_name: "Music"
# },
# {
#   tag_name: "Kid Friendly"
# },
# {
#   tag_name: "Trendy AF"
# },
# {
#   tag_name: "Sports"
# },
# {
#   tag_name: "Do Good"
# },
# {
#   tag_name: "Environmentally Friendly"
# },
# {
#   tag_name: "Adrenaline Rush"
# },
# {
#   tag_name: "Cultural Immersion"
# },
# {
#   tag_name: "Religious"
# },
# {
#   tag_name: "Relaxing"
# },
# {
#   tag_name: "Scuba Diving"
# },
# {
#   tag_name: "Snorkeling"
# },
# {
#   tag_name: "Kayaking"
# },
# {
#   tag_name: "Paddle Boarding"
# },
# {
#   tag_name: "Flying"
# },
# {
#   tag_name: "Cooking"
# },
# ]
# Tag.create!(tag_list)
# puts "Created #{Tag.count} tag/s"

# locations
puts "Creating locations"

location_list = [
{
  city: "Melbourne",
  country: "Australia",
  state: "Victoria",
  latitude: -37.8238,
  longitude: 144.9913
},
{
  city: "Sydney",
  country: "Australia",
  state: "NSW",
  latitude: -33.865143,
  longitude: 151.209900
},
{
  city: "Singapore",
  country: "Singapore",
  state: "Singapore",
  latitude: 1.286025,
  longitude: 103.860812
},
{
  city: "London",
  country: "England",
  state: "England",
  latitude: 51.500923,
  longitude: 0.124604
},
{
  city: "New York",
  country: "USA",
  state: "NY",
  latitude: 40.783076,
  longitude: -73.965334
},
{
  city: "Koh Tao",
  country: "Thailand",
  state: "Thailand",
  latitude: 10.101695,
  longitude: 99.827190
},
{
  city: "Hong Kong",
  country: "China",
  state: "Hong Kong",
  latitude: 22.342605,
  longitude: 114.193774
},
{
  city: "Matsuno",
  country: "Japan",
  state: "Shikoku",
  latitude: 33.205563,
  longitude: 132.711406
},
{
  city: "San Francisco",
  country: "USA",
  state: "California",
  latitude: 37.820192,
  longitude: -122.478213
},
{
  city: "Florence",
  country: "Italy",
  state: "Italy",
  latitude: 43.776935,
  longitude: 11.258739
},
{
  city: "Paris",
  country: "France",
  state: "France",
  latitude: 48.864854,
  longitude: 2.379853
},
{
  city: "Perth",
  country: "Australia",
  state: "Western Australia",
  latitude: -31.941764,
  longitude: 115.861205
},
{
  city: "Auckland",
  country: "New Zealand",
  state: "North Island",
  latitude: -36.851782,
  longitude: 174.763151
},
{
  city: "Bogota",
  country: "Colombia",
  state: "Capital District",
  latitude: 4.7110,
  longitude: -74.0721
},
{
  city: "Willemstad",
  country: "Netherlands",
  state: "Curacao",
  latitude: 12.098145,
  longitude: -68.8824
},
{
  city: "Kralendijk",
  country: "Bonaire",
  state: "Netherlands",
  latitude: 12.1443,
  longitude: -68.2655
}
]

location_photos = [
  "https://images.unsplash.com/photo-1514395462725-fb4566210144?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2851&q=80",
  "https://images.unsplash.com/photo-1524293581917-878a6d017c71?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1525625293386-3f8f99389edd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1549&q=80",
  "https://images.unsplash.com/photo-1508711046474-2f4c2d3d30ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1477882244523-716124bf91a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2849&q=80",
  "https://images.unsplash.com/photo-1537956965359-7573183d1f57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1568&q=80",
  "https://images.unsplash.com/photo-1517144447511-aebb25bbc5fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1449034446853-66c86144b0ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1476362174823-3a23f4aa6d76?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1652&q=80",
  "https://images.unsplash.com/photo-1539867462940-bc733134d96e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1568&q=80",
  "https://images.unsplash.com/photo-1507699622108-4be3abd695ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80",
  "https://images.unsplash.com/photo-1536334906170-ffa95819c4d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
  "https://images.unsplash.com/photo-1541748603027-cbfefa3a6c8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1952&q=80",
  "https://images.unsplash.com/photo-1495127466322-72b03a266c4a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
]

Location.create!(location_list)
puts "Created #{Location.count} location(s)"

counter = 0

Location.all.each do |location|
  file = URI.open(location_photos[counter])
  location.photo.attach(io: file, filename: "#{location.city}.png", content_type: 'image/png')
  location.save
  counter += 1 
end

# activities
# puts "Creating activities"

# activity_list = [
# {
#   title: "Food Markets",
#   photo: "https://images.unsplash.com/photo-1531638280689-3b3cd8ac2833?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1498&q=80"
# },
# {
#   title: "Festival",
#   photo: "https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Snorkeling",
#   photo: "https://images.unsplash.com/photo-1499242611767-cf8b9be02854?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1480&q=80"
# },
# {
#   title: "Scuba Diving",
#   photo: "https://www.dive.is/thumbs/diving-snorkeling-tours/diving-day-tours/silfra-diving-day-tour/colorful-clear-water-silfra-1800x1199.jpg"
# },
# {
#   title: "Night Life",
#   photo: "https://images.unsplash.com/photo-1471967183320-ee018f6e114a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2102&q=80"
# },
# {
#   title: "Hiking",
#   photo: "https://images.unsplash.com/photo-1519904981063-b0cf448d479e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Sightseeing",
#   photo: "https://images.unsplash.com/photo-1486591913781-4bee9ed65bfe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Walking Tours",
#   photo: "https://images.unsplash.com/photo-1501621965065-c6e1cf6b53e2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1504&q=80"
# },
# {
#   title: "Cultural Events",
#   photo: "https://images.unsplash.com/photo-1547366868-f5d6fab0440f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
# },
# {
#   title: "Street Food",
#   photo: "https://images.unsplash.com/photo-1493843007199-f4397137f7d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Night Markets",
#   photo: "https://images.unsplash.com/photo-1526139334526-f591a54b477c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Music Events",
#   photo: "https://images.unsplash.com/photo-1524187208855-b6c2f1e78bce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Cycling",
#   photo: "https://images.unsplash.com/photo-1541625602330-2277a4c46182?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Massage & Spas",
#   photo: "https://images.unsplash.com/photo-1544161515-4ab6ce6db874?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Art Events",
#   photo: "https://images.unsplash.com/photo-1485518994577-6cd6324ade8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1288&q=80"
# },
# {
#   title: "Surfing",
#   photo: "https://images.unsplash.com/photo-1530870110042-98b2cb110834?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Paddle Boarding",
#   photo: "https://images.unsplash.com/photo-1526188717906-ab4a2f949f26?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Vista Points",
#   photo: "https://images.unsplash.com/photo-1483860714521-89abcb02604b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Clubbing",
#   photo: "https://images.unsplash.com/photo-1506485854521-3e13d857db0b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2089&q=80"
# },
# {
#   title: "Skate Boarding",
#   photo: "https://images.unsplash.com/photo-1445251836269-d158eaa028a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"
# },
# {
#   title: "Shopping",
#   photo: "https://images.unsplash.com/photo-1482304651556-cb27a6fb596a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1406&q=80"
# },
# {
#   title: "Fishing",
#   photo: "https://images.unsplash.com/photo-1502045431165-29b5e9f5befc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Road Trip",
#   photo: "https://images.unsplash.com/photo-1468818438311-4bab781ab9b8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"
# },
# {
#   title: "Volunteering",
#   photo: "https://images.unsplash.com/photo-1526976668912-1a811878dd37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Camping",
#   photo: "https://images.unsplash.com/photo-1414016642750-7fdd78dc33d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1498&q=80"
# },
# {
#   title: "Skiing",
#   photo: "https://images.unsplash.com/photo-1548825519-a10e24471ff8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2200&q=80"
# },
# {
#   title: "Snowboarding",
#   photo: "https://images.unsplash.com/photo-1523246181290-a16e4b9a00b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1334&q=80"
# },
# {
#   title: "Kayaking",
#   photo: "https://images.unsplash.com/photo-1463694372132-6c267f6ba561?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"
# },
# {
#   title: "Adrenaline Rush",
#   photo: "https://images.unsplash.com/photo-1526385604508-05e4e7f0bc61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1789&q=80"
# },
# {
#   title: "Nature Tours",
#   photo: "https://images.unsplash.com/photo-1548429930-163885742a36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Dancing",
#   photo: "https://images.unsplash.com/photo-1463592177119-bab2a00f3ccb?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Cultural Festival",
#   photo: "https://images.unsplash.com/photo-1559760434-0981df057e83?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
# },
# {
#   title: "Tech",
#   photo: "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
# }
# ]

# Activity.create!(activity_list)
# puts "Created #{Activity.count} activit(y/ies)"

# itineraries
puts "Creating trips"
trip_list = [
{
  user_id: User.find_by(username: "Paal").id,
  title: "Greatest Ozzie Adventure",
  start_date: "2021-04-15",
  end_date: "2021-06-23",
  description: "A trip across Australia",
  status: 1,
  visibility: 1,
  trip_type: 1
},
{
  user_id: User.find_by(username: "gabby").id,
  title: "Asian Food Tour",
  start_date: "2021-06-20",
  end_date: "2021-06-25",
  description: "A culinary tour of asia",
  status: 0,
  visibility: 1,
  trip_type: 1
},
{
  user_id: User.find_by(username: "gabby").id,
  title: "Thai Scuba Adventure",
  start_date: "2021-06-26",
  end_date: "2021-06-30",
  description: "Best scuba diving spots in Thailand",
  status: 1,
  visibility: 0,
  trip_type: 0
},
{
  user_id: User.find_by(username: "sophisophi").id,
  title: "Best of Hong Kong",
  start_date: "2021-07-01",
  end_date: "2021-07-05",
  description: "Tasty Dim Sum and shopping fun!",
  status: 1,
  visibility: 1,
  trip_type: 0
},
{
  user_id: User.find_by(username: "Paal").id,
  title: "Cherry Blossoms in Japan",
  start_date: "2021-07-08",
  end_date: "2021-07-12",
  description: "Beautiful view of many cherry blossoms and interesting historical shrines and temples.",
  status: 1,
  visibility: 0,
  trip_type: 1
},
{
  user_id: User.find_by(username: "Paal").id,
  title: "California Dreaming",
  start_date: "2021-07-15",
  end_date: "2021-07-19",
  description: "Golden Gate Bridge, networking in Silicon Valley, and National Parks",
  status: 0,
  visibility: 0,
  trip_type: 1
},
{
  user_id: User.find_by(username: "sophisophi").id,
  title: "New York New York",
  start_date: "2021-07-22",
  end_date: "2021-07-26",
  description: "Relaxing in the sun in Central Park",
  status: 1,
  visibility: 1,
  trip_type: 0
},
{
  user_id: User.find_by(username: "gabby").id,
  title: "My Fair London",
  start_date: "2021-07-29",
  end_date: "2021-08-02",
  description: "Explore the London markets and tea in Mayfair",
  status: 0,
  visibility: 1,
  trip_type: 0
},
{
  user_id: User.find_by(username: "Paal").id,
  title: "Euro Trip",
  start_date: "2021-08-05",
  end_date: "2021-08-09",
  description: "Food, Museums and Shopping",
  status: 0,
  visibility: 0,
  trip_type: 0
},
{
  user_id: User.find_by(username: "sheilz").id,
  title: "NZ Visa Run",
  start_date: "2021-06-17",
  end_date: "2021-06-24",
  description: "A journey to get the precious visa.",
  status: 0,
  visibility: 1,
  trip_type: 0
},
{
  user_id: User.find_by(username: "sheilz").id,
  title: "ABC Islands & Colombia Extravaganza",
  start_date: "2021-03-20",
  end_date: "2021-04-09",
  description: "Snorkeling, Hiking, and Exploring: the ABC's of Travel",
  status: 1,
  visibility: 1,
  trip_type: 0
},
{
  user_id: User.find_by(username: "sophisophi").id,
  title: "New Zealand Exploration",
  start_date: "2021-06-19",
  end_date: "2021-06-24",
  description: "Explore the best NZ has to offer! #kiwilife",
  status: 1,
  visibility: 1,
  trip_type: 0
},
{
  user_id: User.find_by(username: "gabby").id,
  title: "Kiwi Living",
  start_date: "2021-07-20",
  end_date: "2021-07-28",
  description: "Experience the life of a Kiwi and explore more.",
  status: 1,
  visibility: 1,
  trip_type: 1
}
]
Trip.create!(trip_list)
puts "Created #{Trip.count} trip(s)"

# events
puts "Creating events"
event_list = [
{
  location_id: Location.find_by(city: "Melbourne").id,
  trip_id: Trip.find_by(title: "Greatest Ozzie Adventure").id,
#   activity_id: Activity.find_by(title: "Tech").id,
  title: "Le Wagon Demo Day",
  start_date: "2021-06-14 18:00:00",
  end_date: "2021-06-14 20:00:00",
  description: "Pushing boundaries in education through tech.",
  max_spots: 18
},
{
  location_id: Location.find_by(city: "Melbourne").id,
  trip_id: Trip.find_by(title: "Greatest Ozzie Adventure").id,
#   activity_id: Activity.find_by(title: "Festival").id,
  title: "Bottomless G&Tea Party",
  start_date: "2021-06-18 14:00:00",
  end_date: "2021-06-18 17:00:00",
  description: "Enjoy two hours of bottomless gin and tonics, matched with delicious sweet and savoury treats. Choose from house-infused gins served in quaint tea cups - find your favourite flavour!",
  max_spots: 4
},
{
  location_id: Location.find_by(city: "Melbourne").id,
  trip_id: Trip.find_by(title: "Greatest Ozzie Adventure").id,
  # activity_id: Activity.find_by(title: "Food Markets").id,
  title: "QVM Winter Night Market",
  start_date: "2021-06-19 17:00:00",
  end_date: "2021-06-19 22:00:00",
  description: "A foodie feast",
  max_spots: 3
},
{
  location_id: Location.find_by(city: "Sydney").id,
  trip_id: Trip.find_by(title: "Greatest Ozzie Adventure").id,
#   activity_id: Activity.find_by(title: "Cultural Events").id,
  title: "Sydney Opera House",
  start_date: "2021-06-21 17:00:00",
  end_date: "2021-06-21 22:00:00",
  description: "A night at the Opera",
  max_spots: 2
},
{
  location_id: Location.find_by(city: "Perth").id,
  trip_id: Trip.find_by(title: "Greatest Ozzie Adventure").id,
#   activity_id: Activity.find_by(title: "Snorkeling").id,
  title: "Snorkeling off the Perth coast",
  start_date: "2021-06-23 09:00:00",
  end_date: "2021-06-23 18:00:00",
  description: "snorkeling around Rottnest Island",
  max_spots: 2
},
{
  location_id: Location.find_by(city: "Florence").id,
  trip_id: Trip.find_by(title: "Euro Trip").id,
#   activity_id: Activity.find_by(title: "Nature Tours").id,
  title: "Visit a Stunning Winery",
  start_date: "2021-08-05 09:00:00",
  end_date: "2021-08-05 17:00:00",
  description: "Visit the most incredible wineries in Florence on a massive winery tour.",
  max_spots: 3
},
{
  location_id: Location.find_by(city: "Florence").id,
  trip_id: Trip.find_by(title: "Euro Trip").id,
#   activity_id: Activity.find_by(title: "Sightseeing").id,
  title: "David by Michelangelo",
  start_date: "2021-08-06 09:00:00",
  end_date: "2021-08-06 17:00:00",
  description: "Michelangelo’s defiant David statue has captivated the world for centuries. Considered one of art history’s major masterpieces, the marble sculpture showcases both the artist’s skill and the fine art focus that defines the Renaissance.",
  max_spots: 2
},
{
  location_id: Location.find_by(city: "Paris").id,
  trip_id: Trip.find_by(title: "Euro Trip").id,
#   activity_id: Activity.find_by(title: "Tech").id,
  title: "Le Wagon reunion",
  start_date: "2021-08-07 15:30:00",
  end_date: "2021-08-07 17:00:00",
  description: "A total geek fest!",
  max_spots: 3
},
{
  location_id: Location.find_by(city: "Singapore").id,
  trip_id: Trip.find_by(title: "Asian Food Tour").id,
#   activity_id: Activity.find_by(title: "Food Markets").id,
  title: "Chinatown Complex Food Centre",
  start_date: "2021-06-20 17:00:00",
  end_date: "2021-06-20 22:00:00",
  description: "largest hawker centre in Singapore with over 260 food stalls.",
  max_spots: 4
},
{
  location_id: Location.find_by(city: "Hong Kong").id,
  trip_id: Trip.find_by(title: "Asian Food Tour").id,
#   activity_id: Activity.find_by(title: "Night Markets").id,
  title: "Temple Street night market",
  start_date: "2021-06-22 20:30:00",
  end_date: "2021-06-22 22:00:00",
  description: "Temple Street is the largest and most popular night market in Hong Kong",
  max_spots: 3
},
{
  location_id: Location.find_by(city: "Koh Tao").id,
  trip_id: Trip.find_by(title: "Thai Scuba Adventure").id,
#   activity_id: Activity.find_by(title: "Scuba Diving").id,
  title: "Diving with Big Blue",
  start_date: "2021-06-26 08:30:00",
  end_date: "2021-06-30 22:00:00",
  description: "Best diving round the island",
  max_spots: 3
},
{
  location_id: Location.find_by(city: "Hong Kong").id,
  trip_id: Trip.find_by(title: "Best of Hong Kong").id,
#   activity_id: Activity.find_by(title: "Shopping").id,
  title: "Elements Shopping Mall",
  start_date: "2021-07-01 09:30:00",
  end_date: "2021-07-05 23:00:00",
  description: "Elements Hong Kong brings together a host of high-end brands with 123 stores selling accessories from the likes of Mulberry, shoes from Jimmy Choo, fashion from Max Mara, and watches from ROLEX.",
  max_spots: 3
},
{
  location_id: Location.find_by(city: "Matsuno").id,
  trip_id: Trip.find_by(title: "Cherry Blossoms in Japan").id,
#   activity_id: Activity.find_by(title: "Nature Tours").id,
  title: "Cherry Blossoms in Matsuno",
  start_date: "2021-07-08 09:30:00",
  end_date: "2021-07-12 23:00:00",
  description: "Cherry Blossoms bloom over Meguro River",
  max_spots: 2
},
{
  location_id: Location.find_by(city: "San Francisco").id,
  trip_id: Trip.find_by(title: "California Dreaming").id,
#   activity_id: Activity.find_by(title: "Sightseeing").id,
  title: "Checking out the Golden Gate Bridge",
  start_date: "2021-07-15 09:30:00",
  end_date: "2021-07-19 23:00:00",
  description: "Fantastic views of the GG Bridge",
  max_spots: 2
},
{
  location_id: Location.find_by(city: "New York").id,
  trip_id: Trip.find_by(title: "New York New York").id,
#   activity_id: Activity.find_by(title: "Clubbing").id,
  title: "K-Pop Karaoke in Korea Town",
  start_date: "2021-07-22 20:30:00",
  end_date: "2021-07-22 23:00:00",
  description: "Getting it on, Gangnam Style!",
  max_spots: 2
},
{
  location_id: Location.find_by(city: "London").id,
  trip_id: Trip.find_by(title: "My Fair London").id,
#   activity_id: Activity.find_by(title: "Sightseeing").id,
  title: "Traditional Afternoon Tea at The Ritz, Mayfair",
  start_date: "2021-07-29 15:30:00",
  end_date: "2021-08-05 17:00:00",
  description: "This most charming traditional Afternoon Tea in Mayfair, is served in the spectacular Palm Court, with glittering chandeliers and elegant mirrors, which add a light and stylish flourish to the room.
  The Ritz London is the only hotel in the UK to have a certified Tea Sommelier, Giandomenico Scanu, who travels around the world to various tea plantations to source our wonderful teas.",
  max_spots: 3
},
{
  location_id: Location.find_by(city: "Auckland").id,
  trip_id: Trip.find_by(title: "NZ Visa Run").id,
#   activity_id: Activity.find_by(title: "Hiking").id,
  title: "Hiking the Lonely Mountain",
  start_date: "2021-06-20 16:30:00",
  end_date: "2021-06-20 20:00:00",
  description: "Hike a mountain and potentially find a dragon.",
  max_spots: 0
},
{
  location_id: Location.find_by(city: "Melbourne").id,
  trip_id: Trip.find_by(title: "NZ Visa Run").id,
#   activity_id: Activity.find_by(title: "Night Life").id,
  title: "Celebrate the Le Wagon End",
  start_date: "2021-06-17 16:30:00",
  end_date: "2021-06-17 20:00:00",
  description: "Have a blast in the Drunken Pony with the rest of the class before the beginning of the visa run.",
  max_spots: 6
},
{
  location_id: Location.find_by(city: "Kralendijk").id,
  trip_id: Trip.find_by(title: "ABC Islands & Colombia Extravaganza").id,
#   activity_id: Activity.find_by(title: "Snorkeling").id,
  title: "Bonaire Nation Park - Snorkeling",
  start_date: "2021-03-23 08:30:00",
  end_date: "2021-03-23 17:00:00",
  description: "Have the most incredible experience snorkeling in the Bonaire National Park. See turtles, squid, tons of coral and fish!",
  max_spots: 7
},
{
  location_id: Location.find_by(city: "Willemstad").id,
  trip_id: Trip.find_by(title: "ABC Islands & Colombia Extravaganza").id,
#   activity_id: Activity.find_by(title: "Night Life").id,
  title: "Blue Curacao Experience",
  start_date: "2021-03-25 14:30:00",
  end_date: "2021-03-25 17:00:00",
  description: "Groupon for two to have a blue Curacao experience.",
  max_spots: 2
},
{
  location_id: Location.find_by(city: "Bogota").id,
  trip_id: Trip.find_by(title: "ABC Islands & Colombia Extravaganza").id,
#   activity_id: Activity.find_by(title: "Hiking").id,
  title: "Hike in the Colombian Cloud Rainforest",
  start_date: "2021-03-30 07:30:00",
  end_date: "2021-03-30 20:00:00",
  description: "Hike in a cloud rainforest, round trip 14km. Waterfalls, alpacas, and clouds.",
  max_spots: 0
},
{
  location_id: Location.find_by(city: "Auckland").id,
  trip_id: Trip.find_by(title: "New Zealand Exploration").id,
#   activity_id: Activity.find_by(title: "Nature Tours").id,
  title: "Glowing Cave Exploration",
  start_date: "2021-06-21 08:30:00",
  end_date: "2021-06-21 14:00:00",
  description: "Go into the glow worm cave and find something precious.",
  max_spots: 12
},
{
  location_id: Location.find_by(city: "Auckland").id,
  trip_id: Trip.find_by(title: "Kiwi Living").id,
#   activity_id: Activity.find_by(title: "Kayaking").id,
  title: "Kayaking NZ Adventures",
  start_date: "2021-07-21 08:30:00",
  end_date: "2021-07-21 14:00:00",
  description: "Kayak in the stunning waters in NZ.",
  max_spots: 4
}
]
Event.create!(event_list)
puts "Created #{Event.count} event(s)"

# creates eventregistrations
puts "Creating EventRegistration"
er_list = [
{
  event_id: Event.find_by(title: "Celebrate the Le Wagon End").id,
  user_id: User.find_by(username: "Paal").id,
  status: 0
},
{
  event_id: Event.find_by(title: "Celebrate the Le Wagon End").id,
  user_id: User.find_by(username: "sophisophi").id,
  status: 0
},
{
  event_id: Event.find_by(title: "Celebrate the Le Wagon End").id,
  user_id: User.find_by(username: "gabby").id,
  status: 1
},
{
  event_id: Event.find_by(title: "Glowing Cave Exploration").id,
  user_id: User.find_by(username: "gabby").id,
  status: 1
},
{
  event_id: Event.find_by(title: "Diving with Big Blue").id,
  user_id: User.find_by(username: "sheilz").id,
  status: 1
},
{
  event_id: Event.find_by(title: "Le Wagon Demo Day").id,
  user_id: User.find_by(username: "sophisophi").id,
  status: 1
},
{
  event_id: Event.find_by(title: "Le Wagon Demo Day").id,
  user_id: User.find_by(username: "gabby").id,
  status: 1
}
]

EventRegistration.create!(er_list)
puts "Created #{EventRegistration.count} eventregistration(s)"
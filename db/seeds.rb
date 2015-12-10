# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

swift101 = Product.create(title: "Swift 101: Getting started", subtitle: "This workshop will give you the tools to be comfortable with Swift using the Apple Watch.", description: "Maecenas sed diam eget risus varius blandit sit amet non magna. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Maecenas faucibus mollis interdum.", sku: "SWIFT101", price: "300.00", product_image: "swift-101.png", product_thumb_image: "swift-101-thumb.png",  location_address: "500 E Kennedy Blvd. 3rd Floor. Tampa FL 33602", location_image: "tampabay-wave.png", location: "Tampa Bay Wave", date: "Jan. 8th - 9th", email_image: "https://s3.amazonaws.com/cocoa-academy/swift-101-email.png",
city: "Tampa, FL", details: "Swift 101 details go here.")

day = swift101.schedule_days.create(name: "Friday")
day.schedule_events.create(name: "Welcome", description: "Welcome to our class", instructor: "Gavin", start_time: "09:00AM")
day.schedule_events.create(name: "Getting Started", description: "Velit enim scelerisque sem, accumsan suscipit lectus odio ac justo. Fusce in felis a enim rhoncus placerat. Cras nec eros et.", instructor: "Gavin", start_time: "10:00AM")
day.schedule_events.create(name: "Lunch", description: "CHOW IS ON",  instructor: "", start_time: "11:00AM", icon: "fa-cutlery")

day = swift101.schedule_days.create(name: "Saturday")
day.schedule_events.create(name: "Swift Basics", description: "Learn everything you need", instructor: "Gavin", start_time: "09:00AM")
day.schedule_events.create(name: "Swift Advanced ", description: "More of what you need", instructor: "Gavin", start_time: "11:30AM")
day.schedule_events.create(name: "Lunch", description: "CHOW IS ON", instructor: "", start_time: "12:00PM", icon: "fa-cutlery")
day.schedule_events.create(name: "Deploying your app", description: "Get that sweet Apple $$$", instructor: "Gavin", start_time: "2:00PM")

building_an_app = Product.create(title: "Building an iOS App", subtitle: "In this workshop we will build an entire iOS App using Swift as well as storyboard basics.", description: "Curabitur blandit tempus porttitor. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ullamcorper nulla non metus auctor fringilla.", sku: "SWIFT201", price: "300.00", product_image: "building-apps.png",  product_thumb_image: "building-apps-thumb.png", location_address: "260 1st Ave South, Suite. 300, Saint Petersburg, FL 33701", location_image: "iron-yard.png", email_image: "https://s3.amazonaws.com/cocoa-academy/building-apps-email.png", location: "Iron Yard", date: "Jan. 15th - 16th", city: "St. Petersburg, FL",  details: "Building an iOS App details go here.")
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
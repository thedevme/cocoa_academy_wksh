# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

swift101 = Product.create(title: "Swift 101: Getting started", subtitle: "This workshop will give you the tools to be comfortable with Swift using the Apple Watch.", description: "Getting a strong understanding of Swift will really give you the foundation of being able to create great apps. Instead of working thru playground for a day and a half we will create an Apple Watch app.  There will be no storyboarding (visual UI) done in this workshop all the storyboard files and assets will be given to you.  We will focus only on the code that makes an app run.  By the time you finish this workshop you will be comfortable knowing how to write Swift code and have a foundation that you can build on after the workshop.", sku: "SWIFT101", price: "300.00", product_image: "swift-101.png", product_thumb_image: "swift-101-thumb.png",  location_address: "500 E Kennedy Blvd. 3rd Floor. Tampa FL 33602", location_image: "tampabay-wave.png", location: "Tampa Bay Wave", date: "Jan. 8th - 9th", email_image: "https://s3.amazonaws.com/cocoa-academy/swift-101-email.png",
city: "Tampa, FL", details: "Swift 101 details go here.")

day = swift101.schedule_days.create(name: "Friday")
day.schedule_events.create(name: "Welcome", description: "InstallFest", instructor: "Craig", start_time: "6:30PM")
day.schedule_events.create(name: "Getting Started", description: "Swift Basics with playground", instructor: "Craig", start_time: "7:30PM")

day = swift101.schedule_days.create(name: "Saturday")
day.schedule_events.create(name: "Breakfast and Arrival", description: "Getting setup for the class", instructor: "Craig", start_time: "09:30AM")
day.schedule_events.create(name: "Welcome", description: "Welcome Presentation", instructor: "Craig", start_time: "10:00AM")
day.schedule_events.create(name: "Lets get started!", description: "Quick refresher on Swift basics & start coding our app", instructor: "Craig", start_time: "10:30AM")
day.schedule_events.create(name: "Break", description: "Stretch the legs!", instructor: "Craig", start_time: "11:30AM")
day.schedule_events.create(name: "Lets get back to it!", description: "App continued", instructor: "Craig", start_time: "11:45AM")
day.schedule_events.create(name: "Lunch", description: "CHOW IS ON", instructor: "", start_time: "12:30PM", icon: "fa-cutlery")
day.schedule_events.create(name: "Lets get back to it!", description: "App continued", instructor: "Craig", start_time: "1:30PM")
day.schedule_events.create(name: "Break", description: "Stretch the legs!", instructor: "Craig", start_time: "2:30AM")
day.schedule_events.create(name: "Final Stretch", description: "App continued", instructor: "Craig", start_time: "2:45PM")
day.schedule_events.create(name: "Wrapping Up", description: "Wrap Up", instructor: "Craig", start_time: "4:00PM")

building_an_app = Product.create(title: "Building an iOS App", subtitle: "In this workshop we will build an entire iOS App using Swift as well as storyboard basics.", description: "We will start by first building our first app using the Apple Watch.  This app will give you a small step into the iOS world and allow you to see how an app works on a smaller scale. Once we get our feet wet we will jump right in and start coding our first real app.  During the day you will learn storyboard basics, how to access feeds from online and understand the basic structure of what it takes to build an app.  By the time you finish this workshop you should be closer to understanding everything you need to start making the next big app.", sku: "SWIFT201", price: "300.00", product_image: "building-apps.png",  product_thumb_image: "building-apps-thumb.png", location_address: "260 1st Ave South, Suite. 300, Saint Petersburg, FL 33701", location_image: "iron-yard.png", email_image: "https://s3.amazonaws.com/cocoa-academy/building-apps-email.png", location: "Iron Yard", date: "Jan. 15th - 16th", city: "St. Petersburg, FL",  details: "Building an iOS App details go here.")

build_day = building_an_app.schedule_days.create(name: "Friday")
build_day.schedule_events.create(name: "Welcome", description: "InstallFest", instructor: "Craig", start_time: "6:30PM")
build_day.schedule_events.create(name: "Getting Started", description: "Building a small Apple Watch App", instructor: "Craig", start_time: "7:30PM")

build_day = building_an_app.schedule_days.create(name: "Saturday")
day.schedule_events.create(name: "Breakfast and Arrival", description: "Getting setup for the class", instructor: "Craig", start_time: "09:30AM")
build_day.schedule_events.create(name: "Welcome", description: "Welcome Presentation", instructor: "Craig", start_time: "10:00AM")
build_day.schedule_events.create(name: "Lets get started!", description: "Quick refresher on Swift basics & start coding our app", instructor: "Craig", start_time: "10:30AM")
build_day.schedule_events.create(name: "Break", description: "Stretch the legs!", instructor: "Craig", start_time: "11:30AM")
build_day.schedule_events.create(name: "Lets get back to it!", description: "App continued", instructor: "Craig", start_time: "11:45AM")
build_day.schedule_events.create(name: "Lunch", description: "CHOW IS ON", instructor: "", start_time: "12:30PM", icon: "fa-cutlery")
build_day.schedule_events.create(name: "Lets get back to it!", description: "App continued", instructor: "Craig", start_time: "1:30PM")
build_day.schedule_events.create(name: "Break", description: "Stretch the legs!", instructor: "Craig", start_time: "2:30AM")
build_day.schedule_events.create(name: "Final Stretch", description: "App continued", instructor: "Craig", start_time: "2:45PM")
build_day.schedule_events.create(name: "Wrapping Up", description: "Wrap Up", instructor: "Craig", start_time: "4:00PM")



AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

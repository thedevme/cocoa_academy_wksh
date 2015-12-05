# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

swift101 = Product.create(title: "Swift 101: Let's get started", subtitle: "Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.", description: "Maecenas sed diam eget risus varius blandit sit amet non magna. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Maecenas faucibus mollis interdum.", sku: "SWIFT101", price: "300.00", product_image: "swift101.png", details: "Swift 101 details go here.")

building_an_app = Product.create(title: "Building an iOS App", subtitle: "Cras mattis consectetur purus sit amet fermentum.", description: "Curabitur blandit tempus porttitor. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ullamcorper nulla non metus auctor fringilla.", sku: "SWIFT201", price: "300.00", product_image: "building-apps.png", details: "Building an iOS App details go here.")

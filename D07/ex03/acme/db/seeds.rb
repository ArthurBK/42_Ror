# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'ffaker'
require 'open-uri'
require 'nokogiri'

price = (1..90).to_a

# User.destroy_all
Product.destroy_all
Brand.destroy_all
50.times do |tm|
  mk = Brand.create!(name: FFaker::Product.brand,
    avatar: open(FFaker::Avatar.image))
  50.times do |tw|
    Product.create!(name: FFaker::Product.product,
      pict: open(FFaker::Avatar.image),
      description: FFaker::HipsterIpsum.paragraph,
      brand_id: mk.id, price:price.sample)
  end
end
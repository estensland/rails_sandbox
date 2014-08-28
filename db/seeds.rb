# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
x = Post.create(title: 'First!', body: 'This was the first')
x.comments << Comment.create(body: 'No it was not!') << Comment.create(body: 'Where are we?')
x.tags << Tag.create(name: 'Worthless') << Tag.create(name: 'Interwebs')

x = Post.create(title: 'Duran Duran', body: 'Neither Duran, nor Duran, Discuss')
x.comments << Comment.create(body: 'It be Duran!')
x.tags << Tag.create(name: 'Worthless') << Tag.create(name: 'cheeeeese') << Tag.create(name: "80's music")

x = Post.create(title: 'Khawarij', body: 'Progressive Gender/Economic equalists? or Regressive Zealous Biogts')
x.comments << Comment.create(body: 'Mountains are for the winners!') << Comment.create(body: 'Go al-Shaybani!') << Comment.create(body: 'Go al-Khaybari!')
x.tags << Tag.create(name: 'Blast From Past')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



user1 = User.create({username: 'honeybadger20'})
user2 = User.create({username: 'mildewandmalarkey'})
user3 = User.create({username: 'lamppostmagic420'})


artwork1 = Artwork.create({title: 'Ride of the Honey Badger at Dawn', img_url: 'www.dabadger.com', artist_id: user1.id})
artwork2 = Artwork.create({title: 'Mallard Duck Mayhem', img_url: 'www.duckmayhem.com', artist_id: user2.id})
artwork3 = Artwork.create({title: 'The Tiger, the Wizard, and the Closet', img_url: 'www.narniofanfic.com', artist_id: user3.id})

artwork_share1 = ArtworkShare.create({artwork_id: artwork1.id, viewer_id: user2.id})
artwork_share2 = ArtworkShare.create({artwork_id: artwork1.id, viewer_id: user3.id})
artwork_share3 = ArtworkShare.create({artwork_id: artwork3.id, viewer_id: user2.id})
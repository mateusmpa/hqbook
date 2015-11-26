# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SeriesBook.create(title: 'Avengers - Assemble',
                  year: 1,
                  publisher: 'Marvel',
                  review: 'Lorem ipsum...',
                  release: DateTime.now,
                  editions_number: 33,
                  image: File.open(Rails.root.join('spec',
                                                   'images',
                                                   'avengers.jpg')))

ComicBook.create(title: 'The Invencible Iron Man',
                 review: 'Lorem ipsum...',
                 publication_year: DateTime.now,
                 edition_number: 55,
                 series_book: SeriesBook.last,
                 image: File.open(Rails.root.join('spec',
                                                  'images',
                                                  'avengers01.jpg')))

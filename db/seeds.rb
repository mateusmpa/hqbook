# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db =>seed (or created alongside the db with db =>setup).
#
# Examples =>
#
#   cities = City.create([{ name => 'Chicago' }, { name => 'Copenhagen' }])
#   Mayor.create(name => 'Emanuel', city => cities.first)

series_book_images = ['app/assets/images/hqs/superman/superman-00.jpg',
                      'app/assets/images/hqs/justiceiro/justiceiro-00.jpg',
                      'app/assets/images/hqs/demolidor/demolidor-00.jpg']

comic_book_series_book_1 = {1 => 'app/assets/images/hqs/superman/superman-01.jpg',
                            2 => 'app/assets/images/hqs/superman/superman-02.jpg',
                            3 => 'app/assets/images/hqs/superman/superman-03.jpg',
                            4 => 'app/assets/images/hqs/superman/superman-04.jpg',
                            5 => 'app/assets/images/hqs/superman/superman-05.jpg',
                            6 => 'app/assets/images/hqs/superman/superman-06.jpg',
                            7 => 'app/assets/images/hqs/superman/superman-07.jpg'}


comic_book_series_book_2 = {1 => 'app/assets/images/hqs/justiceiro/justiceiro-01.jpg',
                            2 => 'app/assets/images/hqs/justiceiro/justiceiro-02.jpg',
                            3 => 'app/assets/images/hqs/justiceiro/justiceiro-03.jpg',
                            4 => 'app/assets/images/hqs/justiceiro/justiceiro-04.jpg',
                            5 => 'app/assets/images/hqs/justiceiro/justiceiro-05.jpg',
                            6 => 'app/assets/images/hqs/justiceiro/justiceiro-06.jpg',
                            7 => 'app/assets/images/hqs/justiceiro/justiceiro-07.jpg',
                            8 => 'app/assets/images/hqs/justiceiro/justiceiro-08.jpg',
                            9 => 'app/assets/images/hqs/justiceiro/justiceiro-09.jpg',
                            10 => 'app/assets/images/hqs/justiceiro/justiceiro-10.jpg',
                            11 => 'app/assets/images/hqs/justiceiro/justiceiro-11.jpg',
                            12 => 'app/assets/images/hqs/justiceiro/justiceiro-12.jpg',
                            13 => 'app/assets/images/hqs/justiceiro/justiceiro-13.jpg',
                            14 => 'app/assets/images/hqs/justiceiro/justiceiro-14.jpg',
                            15 => 'app/assets/images/hqs/justiceiro/justiceiro-15.jpg',
                            16 => 'app/assets/images/hqs/justiceiro/justiceiro-16.jpg',
                            17 => 'app/assets/images/hqs/justiceiro/justiceiro-17.jpg'}

comic_book_series_book_3 = {1 => 'app/assets/images/hqs/demolidor/demolidor-01.jpg',
                            2 => 'app/assets/images/hqs/demolidor/demolidor-02.jpg',
                            3 => 'app/assets/images/hqs/demolidor/demolidor-03.jpg',
                            4 => 'app/assets/images/hqs/demolidor/demolidor-04.jpg',
                            5 => 'app/assets/images/hqs/demolidor/demolidor-05.jpg',
                            6 => 'app/assets/images/hqs/demolidor/demolidor-06.jpg',
                            7 => 'app/assets/images/hqs/demolidor/demolidor-07.jpg'}

series_book_01 = SeriesBook.create(title: 'A Morte do Superman',
                                   year: 1,
                                   publisher: 'DC',
                                   review: 'A Morte do Super-homem é um arco de histórias em quadrinhos que serviu como catalisador para o evento crossover da DC Comics de 1993. O arco de histórias completo é chamado de A Morte e o Retorno do Superman.',
                                   release: '1992-01-01',
                                   editions_number: 7,
                                   image: File.new(series_book_images[0]))

series_book_02 = SeriesBook.create(title: 'Justiceiro',
                                  year: 1,
                                  publisher: 'Marvel',
                                  review: 'The Punisher (no Brasil, O Justiceiro) é um personagem de história em quadrinhos (banda desenhada) da Marvel Comics, alter-ego de Frank Castle. Criado por Gerry Conway, Ross Andru e John Romita, apareceu pela primeira vez em The Amazing Spider-Man nº 129 (1974). É mais corretamente descrito como um anti-herói, sendo um dos mais famosos anti-heróis das histórias em quadrinhos, juntamente com Conan e Motoqueiro Fantasma. No Brasil também foi chamado de O Vingador, quando sua primeira história foi publicada no país, ainda pela EBAL.',
                                  release: '1992-01-01',
                                  editions_number: 17,
                                  image: File.new(series_book_images[1]))

series_book_03 = SeriesBook.create(title: 'Demolidor',
                                    year: 1,
                                    publisher: 'Marvel',
                                    review: 'Demolidor (em inglês, Daredevil, uma expressão que significa Corajoso, Sem medo) é um personagem de HQ da Marvel Comics, criado por Stan Lee e Bill Everett. Sua primeira aparição se deu já em sua própria revista, em 1964. No Brasil, suas histórias foram publicadas pela primeira vez pela EBAL, em 1968. Hoje, o personagem tem revista própria pela editora Panini Comics. Na editora G.E.A., nos anos 70, o personagem recebeu o nome de Defensor Destemido, tradução que, embora extensa, é mais fiel ao original.',
                                    release: '1992-01-01',
                                    editions_number: 7,
                                    image: File.new(series_book_images[2]))

comic_book_series_book_1.each do |edition, image|
  ComicBook.create(title: Faker::Name.title,
                   review: Faker::Lorem.paragraphs,
                   publication_year: '1992-01-01',
                   edition_number: edition,
                   series_book: series_book_01,
                   image: File.new(image))
end

comic_book_series_book_2.each do |edition, image|
  edition += 1
  ComicBook.create(title: Faker::Name.title,
                   review: Faker::Lorem.paragraphs,
                   publication_year: '1992-01-01',
                   edition_number: 1,
                   series_book: series_book_02,
                   image: File.new(image))
end

comic_book_series_book_3.each do |edition, image|
  ComicBook.create(title: Faker::Name.title,
                   review: Faker::Lorem.paragraphs,
                   publication_year: '1992-01-01',
                   edition_number: edition,
                   series_book: series_book_03,
                   image: File.new(image))
end

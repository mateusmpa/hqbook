# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

series_book_01 = SeriesBook.create(title: 'A Morte do Superman',
                                   year: 1,
                                   publisher: 'Marvel',
                                   review: "A Morte do Superman, A Morte do Super-homem é um arco de histórias em quadrinhos que serviu como catalisador para o evento crossover da DC Comics de 1993. O arco de histórias completo é chamado de A Morte e o Retorno do Superman.\n" \
                                   "A premissa é tão simples quanto o título: Superman entra em combate com um aparentemente imbatível monstro chamado Apocalypse nas ruas de Metrópolis. Como desfecho da batalha, ambos combatentes morrem.\n" \
                                   "O crossover descreveu a reação mundial a morte do Superman em 'Funeral para um amigo', o surgimento de quatro indivíduos clamando-se como o 'novo' Superman, e o eventual retorno do Superman original em 'O Retorno do Super-homem'.\n" \
                                   "A história, planejada pelo editor Mike Carlin e a equipe criativa de Superman de Dan Jurgens, Roger Stern, Louise Simonson, Jerry Ordway, e Karl Kesel, atingiu enorme sucesso: os títulos do Superman ganharam exposição internacional, alcançando o topo das vendas de quadrinhos. O evento foi amplamente coberto pela mídia jornalística americana e mundial.",
                                   release: '1992-01-01',
                                   editions_number: 7,
                                   image: File.new('app/assets/images/hqs/superman/superman-00.jpg'))

comic_book_01_01 = ComicBook.create(title: 'Apocalipse',
                                    review: 'Lorem ipsum...',
                                    publication_year: '1992-01-01',
                                    edition_number: 1,
                                    series_book: series_book_01,
                                    image: File.new('app/assets/images/hqs/superman/superman-01.jpg'))

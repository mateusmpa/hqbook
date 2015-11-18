require 'rails_helper'

feature 'Visitor see comic details' do
  scenario 'successfully' do
    series_book_1 = create(
      :series_book, image: File
        .open(Rails.root.join('spec', 'images', 'avengers.jpg')))
    series_book_2 = create(
      :series_book, title: 'Injustice - Gods Among Us')
    comic_book_1 = create(
      :comic_book, series_book: series_book_1,
                   image: File
                    .open(Rails.root.join('spec', 'images', 'avengers01.jpg')))
    create(:comic_book, title: 'Os próprios Deuses',
                        series_book: series_book_2)

    visit root_path

    page.find(:css, "#series-#{series_book_1.id} a").click

    page.find(:css, "#chapters-#{comic_book_1.id} a").click

    expect(page).to have_xpath("//img[contains(@src,'avengers01.jpg')]")
    expect(page).to have_content comic_book_1.title
    expect(page).to have_content comic_book_1.review
    expect(page).to have_content comic_book_1.publication_year
    expect(page).to have_content comic_book_1.edition_number
  end
end

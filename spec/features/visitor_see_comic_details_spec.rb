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

    visit comic_book_path(comic_book_1.id)

    expect(page).to have_xpath("//img[contains(@src,'avengers01.jpg')]")
    expect(page).to have_content comic_book_1.title
    expect(page).to have_content comic_book_1.review
    expect(page)
      .to have_content comic_book_1.publication_year.strftime('%d/%m/%Y')
    expect(page).to have_content comic_book_1.edition_number
  end
end

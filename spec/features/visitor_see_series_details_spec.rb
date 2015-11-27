require 'rails_helper'

feature 'visitor see series details' do
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
    comic_book_2 = create(:comic_book, title: 'Os próprios Deuses',
                                       series_book: series_book_2)

    visit series_book_path(series_book_1.id)

    expect(page).to have_content series_book_1.title
    expect(page).to have_xpath("//img[contains(@src,'avengers.jpg')]")
    expect(page).to have_content series_book_1.year
    expect(page).to have_content series_book_1.publisher
    expect(page).to have_content series_book_1.review
    expect(page).to have_content series_book_1.release
    expect(page).to have_content series_book_1.editions_number
    expect(page).to have_xpath("//img[contains(@src,'avengers01.jpg')]")
    expect(page).to have_content comic_book_1.title
    expect(page).not_to have_content comic_book_2.title
  end
end

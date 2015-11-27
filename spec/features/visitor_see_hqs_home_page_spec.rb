require 'rails_helper'

feature 'visitor see hqs home page' do
  scenario 'successfully' do
    series_book = create(:series_book, image: File
      .open(Rails.root.join('spec', 'images', 'avengers.jpg')))
    visit root_path

    expect(page).to have_content 'HQ Book'
    expect(page).to have_content series_book.title
    expect(page).to have_xpath("//img[contains(@src,'avengers.jpg')]")
  end
end

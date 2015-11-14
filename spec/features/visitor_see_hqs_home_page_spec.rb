require 'rails_helper'

feature 'visitor see hqs home page' do
  scenario 'successfully' do
    create(:comic_book, image: File.open(Rails.root.join('spec',
                                                         'images',
                                                         'avengers.jpg')))
    visit root_path

    expect(page).to have_content('HQ Book')
    expect(page).to have_content('Avengers')
    expect(page).to have_xpath("//img[contains(@src,'avengers.jpg')]")
    expect(page).to have_content('Ver mais')
  end
end

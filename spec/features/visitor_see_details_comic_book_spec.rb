require 'rails_helper'

feature 'Visitor see details comic book' do
  scenario 'successfully' do
    visit series_book_comic_book_path

    expect(page).to have_content('Avengers #27')
    expect(page).to have_xpath("//img[contains(@src,'detail_comic.jpg')]")
    expect(page).to have_content('The Runaways are here! Giant-Man and Victor,
                                  Reptil and Chase, Lightspeed and Karolina.
                                  What happens when these two super-charged
                                  teams collide?')
    expect(page).to have_content('27')
    expect(page).to have_content('2010')
  end
end

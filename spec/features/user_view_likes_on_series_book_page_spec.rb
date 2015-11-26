require 'rails_helper'

feature 'user view likes on series book page' do
  scenario 'successfully' do
    series_book = create(:series_book)
    like = create(:like, likeable: series_book)
    
    visit series_book_path(series_book)

    expect(page).to have_content like.user.name
  end
end

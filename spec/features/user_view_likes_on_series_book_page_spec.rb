require 'rails_helper'

feature 'user view likes on series book page' do
  scenario 'successfully' do

    user = create(:user, avatar: File.open(Rails.root.join('spec',
                                                           'images',
                                                           'user_avatar.png')))
    like = create(:like, user: user)
    series_book = create(:series_book, likes: [like])

    visit series_book_path(series_book)
    expect(page).to have_xpath("//img[contains(@src,'user_avatar.png')]")
    expect(page).to have_content like.user.name
  end
end

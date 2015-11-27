require 'rails_helper'

feature 'User access profiles' do
  scenario 'through comment' do
    series_book = create(:series_book)
    comment = create(:comment, commentable: series_book)

    visit series_book_path(series_book)

    within '#comments' do
      click_on comment.user.name
    end

    expect(page).to have_xpath("//img[contains(@src, 'missing.png')]")
    expect(page).to have_content comment.user.name
  end

  scenario 'through likes' do
    series_book = create(:series_book)
    like = create(:like, likeable: series_book)

    visit series_book_path(series_book)

    within '#likes' do
      click_on like.user.name
    end

    expect(page).to have_xpath("//img[contains(@src, 'missing.png')]")
    expect(page).to have_content like.user.name
  end
end

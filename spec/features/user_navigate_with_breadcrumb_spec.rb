require 'rails_helper'

feature 'User navigate with breadcrumb' do
  scenario 'go from comic to serie' do
    series_book_1 = create(
      :series_book, image: File
        .open(Rails.root.join('spec', 'images', 'avengers.jpg')))

    comic_book_1 = create(
      :comic_book, series_book: series_book_1,
                   image: File
                    .open(Rails.root.join('spec', 'images', 'avengers01.jpg')))

    visit comic_book_path(comic_book_1.id)

    within '#breadcrumbs' do
      click_on series_book_1.title
    end

    expect(current_path).to eq(series_book_path(series_book_1.id))
  end

  scenario 'go from serie to home' do
    series_book_1 = create(
      :series_book, image: File
        .open(Rails.root.join('spec', 'images', 'avengers.jpg')))

    create(:comic_book, series_book: series_book_1,
                        image: File.open(Rails.root.join('spec',
                                                         'images',
                                                         'avengers01.jpg')))

    visit series_book_path(series_book_1.id)

    within '#breadcrumbs' do
      click_on 'Home'
    end

    expect(current_path).to eq(root_path)
  end
  scenario 'go from comic to home' do
    series_book_1 = create(
      :series_book, image: File
        .open(Rails.root.join('spec', 'images', 'avengers.jpg')))

    comic_book_1 = create(
      :comic_book, series_book: series_book_1,
                   image: File
                    .open(Rails.root.join('spec', 'images', 'avengers01.jpg')))

    visit comic_book_path(comic_book_1.id)

    within '#breadcrumbs' do
      click_on 'Home'
    end

    expect(current_path).to eq(root_path)
  end

  scenario 'go from profile to home' do
    user = create(:user)

    visit profile_path(user.id)

    within '#breadcrumbs' do
      click_on 'Home'
    end
  end
end

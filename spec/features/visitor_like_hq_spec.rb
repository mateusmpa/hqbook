require 'rails_helper'

feature 'visitor like hq' do
  scenario 'like with logged user' do
    series_book_1 = create(
      :series_book, image: File
        .open(Rails.root.join('spec', 'images', 'avengers.jpg')))

    user = create(:user)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    page.find(:css, "#series-#{series_book_1.id} a").click

    click_on 'Curtir'

    expect(page).to have_content 'unlike'
  end

  scenario 'unauthenticated user' do
    series_book_1 = create(
      :series_book, image: File
       .open(Rails.root.join('spec', 'images', 'avengers.jpg')))

    visit root_path

    page.find(:css, "#series-#{series_book_1.id} a").click

    expect(page).to have_content 'Logue para curtir!'
  end

  scenario 'unauthenticated user' do
    series_book_1 = create(
      :series_book, image: File
       .open(Rails.root.join('spec', 'images', 'avengers.jpg')))
    user = create(:user)

    visit root_path

    page.find(:css, "#series-#{series_book_1.id} a").click

    click_on 'Logue para curtir!'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    page.find(:css, "#series-#{series_book_1.id} a").click

    click_on 'Curtir'

    expect(page).to have_content 'unlike'
  end

  scenario 'like with logged user' do
    series_book_1 = create(
      :series_book, image: File
        .open(Rails.root.join('spec', 'images', 'avengers.jpg')))

    user = create(:user)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    page.find(:css, "#series-#{series_book_1.id} a").click

    click_on 'Curtir'

    click_on 'unlike'

    expect(page).to have_content 'Curtir'
  end
end

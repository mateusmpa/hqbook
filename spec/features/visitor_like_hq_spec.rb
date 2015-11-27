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
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    within '#series' do
      click_on series_book_1.title
    end


    click_on 'Curtir'

    expect(page).to have_content 'unlike'
  end

  scenario 'unauthenticated user' do
    series_book_1 = create(
      :series_book, image: File
       .open(Rails.root.join('spec', 'images', 'avengers.jpg')))

    visit series_book_path(series_book_1.id)

    expect(page).to have_content 'Logue para curtir!'
  end

  scenario 'unauthenticated user' do
    series_book_1 = create(
      :series_book, image: File
       .open(Rails.root.join('spec', 'images', 'avengers.jpg')))
    user = create(:user)

    visit series_book_path(series_book_1.id)

    click_on 'Logue para curtir!'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    visit series_book_path(series_book_1.id)

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
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    visit series_book_path(series_book_1.id)

    click_on 'Curtir'

    click_on 'unlike'

    expect(page).to have_content 'Curtir'
  end
end

require 'rails_helper'

feature 'visitor like hq' do
  scenario 'logged successfully' do
    series_book = create(
      :series_book, image: File
        .open(Rails.root.join('spec', 'images', 'avengers.jpg')))

    user = create(:user)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.encrypted_password
    click_on 'Log in'

    page.find(:css, "#series-#{series_book.id} a").click

    click_on 'Curtir'

    expect(page).to have_content 'Curtido!'
  end
end

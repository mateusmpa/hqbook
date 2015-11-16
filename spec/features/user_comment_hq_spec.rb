require 'rails_helper'

feature 'User comment HQ' do
  scenario 'successfully' do
    user = create(:user)
    comic_book = create(:comic_book)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    page.find(:css, "#series-#{comic_book.series_book.id} a").click
    page.find(:css, "#chapters-#{comic_book.id} a").click

    fill_in 'Comentário', with: 'Lorem ipsom'
    click_button 'Enviar'

    expect(page).to have_content user.email
    expect(page).to have_content 'Lorem ipsom'
  end

  scenario 'with empty description' do
    user = create(:user)
    comic_book = create(:comic_book)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    page.find(:css, "#series-#{comic_book.series_book.id} a").click
    page.find(:css, "#chapters-#{comic_book.id} a").click

    click_button 'Enviar'

    expect(page).to have_content 'Descrição do comentário é obrigatório'
  end

  scenario 'not logged' do
    comic_book = create(:comic_book)

    visit root_path
    page.find(:css, "#series-#{comic_book.series_book.id} a").click
    page.find(:css, "#chapters-#{comic_book.id} a").click

    expect(page).not_to have_css '.comment_description'
    expect(page).not_to have_css '#comment_description'
    expect(page).not_to have_css '.btn-primary'
    expect(page).to have_content 'Nescessário estar logado para comentar'
  end
end

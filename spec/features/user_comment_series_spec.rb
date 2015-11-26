require 'rails_helper'

feature 'User comment Series' do
  scenario 'successfully' do
    user = create(:user)
    comic_book = create(:comic_book)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    page.find(:css, "#series-#{comic_book.series_book.id} a").click

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

    click_button 'Enviar'

    expect(page).to have_content 'Descrição do comentário é obrigatório'
  end

  scenario 'not logged' do
    comic_book = create(:comic_book)

    visit root_path
    page.find(:css, "#series-#{comic_book.series_book.id} a").click

    expect(page).not_to have_css '.comment_description'
    expect(page).not_to have_css '#comment_description'
    expect(page).not_to have_css '.btn-primary'
    expect(page).to have_content 'Necessário estar logado para comentar'
  end

  scenario 'and the data save successfully' do
    comic_book = create(:comic_book)
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @comment = create(:comment, commentable: comic_book.series_book)
    end

    visit root_path
    page.find(:css, "#series-#{comic_book.series_book.id} a").click

    expect(page).to have_content '24/11/2004 às 01:04'
  end
end

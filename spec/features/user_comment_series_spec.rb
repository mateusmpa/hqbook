require 'rails_helper'

feature 'User comment Series' do
  scenario 'successfully' do
    user = create(:user)
    series_book = create(:series_book)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    visit series_book_path(series_book)

    fill_in 'Comentário', with: 'Lorem ipsom'
    click_button 'Enviar'

    expect(page).to have_css('.panel-heading', text: user.name)
    expect(page).to have_content 'Lorem ipsom'
  end

  scenario 'and the data save successfully' do
    series_book = create(:series_book)
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @comment = create(:comment, commentable: series_book)
    end

    visit series_book_path(series_book)

    expect(page).to have_content '24/11/2004 às 01:04'
  end

  scenario 'with empty description' do
    user = create(:user)
    series_book = create(:series_book)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    visit series_book_path(series_book)

    click_button 'Enviar'

    expect(page).to have_content 'Descrição do comentário é obrigatório'
  end

  scenario 'not logged' do
    series_book = create(:series_book)

    visit series_book_path(series_book)

    expect(page).not_to have_css '.comment_description'
    expect(page).not_to have_css '#comment_description'
    expect(page).not_to have_css '.btn-primary'
    expect(page).to have_content 'Necessário estar logado para comentar'
  end
end

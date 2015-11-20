require 'rails_helper'

feature 'Administrator create new serie book' do
  scenario 'successfully' do

    visit new_series_book_path

    fill_in 'Nome:', with: 'Avengers - Assemble'
    fill_in 'Autor:', with: 'Marvel'
    fill_in 'Sinopse:', with: 'Lorem ipsum dolor sit amet, consectetur
                              adipisicing elit, sed do eiusmod tempor
                              incididunt ut labore et dolore magna aliqua.'
    fill_in 'Ano de lançamento:', with: '01/06/1989'
    fill_in 'Número de edições:', with: '57'
    attach_file('Selecione uma imagem:','spec/images/avengers.jpg')

    click_on 'Salvar'

    expect(page).to have_content('Avengers - Assemble')
    expect(page).to have_content('Marvel')
    expect(page).to have_content('Lorem ipsum dolor sit amet, consectetur
                                  adipisicing elit, sed do eiusmod tempor
                                  incididunt ut labore et dolore magna aliqua.')
    expect(page).to have_content(01/06/1989)
    expect(page).to have_content('57')
    expect(page).to have_xpath("//img[contains(@src, 'avengers.jpg')]")
  end
end

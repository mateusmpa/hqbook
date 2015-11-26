require 'rails_helper'

feature 'Visitor create new profile' do
  scenario 'successfully' do
    visit root_path

    click_on 'Login'
    click_on 'Sign up'

    fill_in 'Nome completo:', with: 'Wesley Soares'
    fill_in 'Cidade:', with: 'São Paulo'
    fill_in 'País:', with: 'Brasil'
    fill_in 'Email:', with: 'wesley@email.com'
    fill_in 'Senha:', with: 'abc123456'
    fill_in 'Confirmação de senha:', with: 'abc123456'

    click_on 'Cadastrar'

    expect(current_path).to eq(root_path)

    expect(page).to have_content('Wesley Soares')
  end
end

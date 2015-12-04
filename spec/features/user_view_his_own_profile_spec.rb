require 'rails_helper'

feature 'User view own profile' do
  scenario 'successfully' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    click_on user.name

    click_on 'Meu perfil'

    expect(page).to have_content user.name
    expect(page).to have_content user.email
    expect(page).to have_content user.city
    expect(page).to have_content user.country
  end

  scenario 'and edit his profile' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    click_on user.name
    click_on 'Meu perfil'
    click_on 'Editar meu perfil'


    within '#information' do
      attach_file('Foto de perfil', 'spec/images/user_avatar.png')
    end
    fill_in 'Nome completo:', with: 'Wesley Soares'
    fill_in 'Data de nascimento:', with: '09/01/1994'
    select 'Masculino', from: 'Sexo'
    fill_in 'Cidade:', with: 'São Paulo'
    fill_in 'País:', with: 'Brasil'
    fill_in 'Senha atual:', with: user.password

    click_on 'Salvar'

    expect(page).to have_xpath("//img[contains(@src,'user_avatar.png')]")
    expect(page).to have_content 'Wesley Soares'
    expect(page).to have_content 'São Paulo'
    expect(page).to have_content 'Brasil'
  end

  scenario 'and exit application' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    click_on user.name
    click_on 'Sair'

    expect(page).to have_button('Fazer Login')
  end
end

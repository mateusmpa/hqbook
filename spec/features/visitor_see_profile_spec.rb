require 'rails_helper'

feature 'Visitor visits user profile' do
  scenario 'successfully' do
    user = create(:user, avatar: File
     .open(Rails.root.join('spec', 'images', 'user_avatar.png')))

    visit profile_path(user.id)

    expect(page).to have_xpath("//img[contains(@src,'user_avatar.png')]")
    expect(page).not_to have_content user.email
    expect(page).to have_content user.name
    expect(page).to have_content user.city
    expect(page).to have_content user.country
  end
end

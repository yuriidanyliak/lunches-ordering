require 'rails_helper'

feature 'guest signs up' do
  scenario 'with valid email and password' do
    user = create(:user)

    visit root_path

    expect(page).to have_content('Log in')

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
  end
end
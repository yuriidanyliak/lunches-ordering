require 'rails_helper'

feature 'guest signs up' do
  scenario 'with valid email and password' do
    user = create(:user)

    visit admin_root_path

    expect(page).to have_content('Lunches Ordering Login')

    fill_in 'admin_user[email]', with: user.email
    fill_in 'admin_user[password]', with: user.password

    click_button 'Login'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Dashboard')
  end
end
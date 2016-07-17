require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    visit root_path

    expect(page).to have_content('Log in')

    click_link 'Sign up'

    expect(page).to have_content('Sign up')

    fill_in 'user[email]', with: 'test@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
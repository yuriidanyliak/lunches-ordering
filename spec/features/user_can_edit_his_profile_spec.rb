require 'rails_helper'

feature 'guest signs up' do
  scenario 'with valid email and password' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit root_path

    expect(page).to have_content('Create an order')

    click_link 'Edit profile'

    expect(page).to have_content('Edit User')

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'new_password'
    fill_in 'user[password_confirmation]', with: 'new_password'
    fill_in 'user[current_password]', with: user.password

    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end
end
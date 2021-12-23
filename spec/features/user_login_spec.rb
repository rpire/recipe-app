require 'rails_helper'

RSpec.feature 'User login', type: :feature do
  background do
    login_user
    visit root_path
  end

  scenario 'Can see welcome message' do
    expect(page).to have_content "Welcome to the Recipe App, #{@user.name}"
  end

  scenario 'Can see Logout button' do
    expect(page).to have_content 'Logout'
  end

  scenario 'Can see recipes button' do
    expect(page).to have_content 'My recipes'
  end

  scenario 'Can see food button' do
    expect(page).to have_content 'My food'
  end
end

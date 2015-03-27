require 'rails_helper'
require 'capybara/rails'

feature 'Homepage' do
  scenario 'User can visit home and see welcome message' do
    visit root_path
    expect(page).to have_content 'Welcome to todoIP'
  end

  scenario 'User can visit create page from home' do
    visit root_path
    click_on 'Join'

    expect(page).to have_content 'Create Account'
  end

end
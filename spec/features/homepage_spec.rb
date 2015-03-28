require "rails_helper"
require "capybara/rails"

feature "Homepage" do


  scenario "User can visit home and see welcome message" do
    visit root_path

    expect(page).to have_content "Welcome to todoIP"
  end

  scenario "User can visit create page from home" do
    visit root_path
    click_on "Join"

    expect(page).to have_content "Create Account"
  end
end

feature "Login" do
  before :each do
    visit root_path
  end

  scenario "Login page displays errors" do
    fill_in "Email", with: "test@testco.com"
    click_on "Login"

    expect(page).to have_content "Login failed"
  end

end
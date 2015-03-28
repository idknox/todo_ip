require "rails_helper"
require "capybara/rails"

feature "Join Page" do
  scenario "Page can display errors" do
    visit root_path
    click_on "Join"

    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_on "Join"

    expect(page).to have_content "Name can't be blank"

    fill_in "Name", with: "Test User"
    fill_in "Email", with: ""
    fill_in "Password", with: "1"
    fill_in "user_password_confirmation", with: "1"

    click_on "Join"

    expect(page).to have_content "Email can't be blank"

    fill_in "Password", with: "password"
    fill_in "user_password_confirmation", with: "pa"
    click_on "Join"

    expect(page).to have_content "Password confirmation doesn't match Password"

    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_on "Join"

    expect(page).to have_content("Account Created", "Welcome to todoIP")
  end
end
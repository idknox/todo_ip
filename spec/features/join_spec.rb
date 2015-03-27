require "rails_helper"
require "capybara/rails"

feature "Join Page" do
  scenario "Page can display errors" do
    visit root_path
    click_on "Join"

    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Join"

    expect(page).to have_content "Name can't be blank"

    fill_in "Name", with: "Test User"
    fill_in "Email", with: ""
    click_on "Join"

    expect(page).to have_content "Email can't be blank"

    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: ""
    click_on "Join"

    expect(page).to have_content "Password can't be blank"

    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: ""
    click_on "Join"

    expect(page).to have_content "Password confirmation can't be blank"

    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "pa"
    click_on "Join"

    expect(page).to have_content "Password confirmation doesn't match Passwor"

    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Join"

    expect(page).to have_content("Account Created", "Welcome to todoIP")
  end
end
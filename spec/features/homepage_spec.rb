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

  scenario "Login page displays errors for invalid user" do
    fill_in "Email", with: "test@test.com"
    click_on "Login"

    expect(page).to have_content "Login failed"

    create_user
    click_on "Login"

    expect(page).to have_content "Login failed"

    fill_in "Password", with: "p"
    click_on "Login"

    expect(page).to have_content "Login failed"
  end

  scenario "Login allows valid user to login" do
    user = create_user

    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content "Welcome, #{user.name}"
  end
end
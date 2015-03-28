require "rails_helper"
require "capybara/rails"

feature "Tasks" do
  before :each do
    @user = create_user
    login(@user)
  end

  scenario "dashboard validates task creation" do

    fill_in "Details", with: "Go to the store"
    fill_in "Due date", with: "03/02/2015"
    click_on "Create new task"
    
    expect(page).to have_content("Welcome, #{@user.name}", "Due Date must be a future date")
  end
end

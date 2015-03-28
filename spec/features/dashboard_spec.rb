require "rails_helper"
require "capybara/rails"

feature "Dashboard" do
  before :each do
    @user = create_user
    login(@user)
  end

  scenario "dashboard validates task creation" do
    click_on "Create new task"

    expect(page).to have_content("Welcome, #{@user.name}", "Details can't be blank")

    fill_in "Details", with: "Go to the store"
    click_on "Create new task"

    expect(page).to have_content("Welcome, #{@user.name}", "Due Date must be a future date")

    fill_in "Due date", with: "03/02/2015"
    click_on "Create new task"

    expect(page).to have_content("Welcome, #{@user.name}", "Due Date must be a future date")

    fill_in "Due date", with: "#{tomorrow}"
    click_on "Create new task"

    expect(page).to have_content("Welcome, #{@user.name}", "Task created")
  end

  scenario "dashboard displays task after creation" do
    fill_in "Details", with: "Go to the store"
    fill_in "Due date", with: "#{tomorrow}"
    click_on "Create new task"

    expect(page).to have_content("Go to the store", formatted_date(tomorrow))
  end
end

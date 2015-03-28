require "rails_helper"
require "capybara/rails"

feature "Dashboard" do
  before :each do
    user = create_user
    login(user)
  end

  scenario "User can create a new task from dashboard" do

    fill_in 'Task details', with: 'Go to the store'
    fill_in 'Due date', with: '03/2'
    click_on 'Create a new task'
  end
end
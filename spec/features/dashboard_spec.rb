require "rails_helper"
require "capybara/rails"

feature "Dashboard" do
  before :each do
    @user = create_user
    login(@user)
  end

  scenario "dashboard validates task creation" do
    click_on "Create new task"

    expect(page).to have_content(
                      "Welcome, #{@user.name}",
                      "Details can't be blank"
                    )

    fill_in "Details", with: "Go to the store"
    click_on "Create new task"

    expect(page).to have_content(
                      "Welcome, #{@user.name}",
                      "Due Date must be a future date"
                    )

    fill_in "Due date", with: "03/02/2015"
    click_on "Create new task"

    expect(page).to have_content(
                      "Welcome, #{@user.name}",
                      "Due Date must be a future date"
                    )

    fill_in "Due date", with: "#{tomorrow}"
    click_on "Create new task"

    expect(page).to have_content("Welcome, #{@user.name}", "Task created")
  end

  scenario "dashboard displays task after creation" do
    fill_in "Details", with: "Go to the store"
    fill_in "Due date", with: "#{tomorrow}"
    click_on "Create new task"

    expect(page).to have_content(
                      "To Do: Go to the store",
                      "Due date: " + formatted_date(tomorrow)
                    )
  end

  scenario "dashboard displays tasks by soonest due" do
    second_task = create_task({details: "Stay home", due_date: tomorrow+1, user_id: @user.id})
    first_task = create_task({user_id: @user.id})
    visit current_path

    expect(page).to have_content(
                      "To Do: Go to the store Due Date: #{formatted_date(first_task.due_date)} Complete " +
                        "Stay home Due Date: #{formatted_date(second_task.due_date)}, 2 days prior to its due date"
                    )
  end

  scenario "user can complete tasks" do
    task_to_complete = create_task({user_id: @user.id})
    second_task = create_task({details: "Stay home", due_date: tomorrow+1, user_id: @user.id})
    visit current_path

    find("#completed-#{task_to_complete.id}").click_on "Complete"

    expect(page).to have_content(
                      "To Do: #{second_task.details} Due Date: #{formatted_date(second_task.due_date)} Complete " +
                        "Recently Completed: #{task_to_complete.details} - completed on #{formatted_date(Date.today)}, 1 day prior to its due date"
                    )
  end
end

require "rails_helper"
require "capybara/rails"

feature "Dashboard" do
  before :each do
    @user = create_user
    login(@user)
  end

  scenario "dashboard validates task creation" do
    click_on "Create Task"

    expect(page).to have_content(
                      @user.name,
                      "Details can't be blank"
                    )

    fill_in "task_details", with: "Go to the store"
    click_on "Create Task"

    expect(page).to have_content(
                      @user.name,
                      "Due Date must be a future date"
                    )

    fill_in "task_due_date", with: "03/02/2015"
    click_on "Create Task"

    expect(page).to have_content(
                      @user.name,
                      "Due Date must be a future date"
                    )

    fill_in "task_due_date", with: "#{tomorrow}"
    click_on "Create Task"

    expect(page).to have_content(@user.name, "Task created")
  end

  scenario "dashboard displays task after creation" do
    fill_in "task_details", with: "Go to the store"
    fill_in "task_due_date", with: "#{tomorrow}"
    click_on "Create Task"

    expect(page).to have_content(
                      "Current Task Due Finish / Cancel Go to the store " +
                        formatted_date(tomorrow)
                    )
  end

  scenario "dashboard displays tasks by soonest due" do
    second_task = create_task({details: "Stay home", due_date: tomorrow+1, user_id: @user.id})
    first_task = create_task({user_id: @user.id})
    visit current_path

    expect(page).to have_content(
                      "Overdue No OverdueTasks Current Task Due Finish / Cancel Go to the store #{formatted_date(first_task.due_date)} " +
                        "Stay home #{formatted_date(second_task.due_date)}"
                    )
  end

  scenario "user can complete tasks" do
    task_to_complete = create_task({user_id: @user.id})
    second_task = create_task({details: "Stay home", due_date: tomorrow+1, user_id: @user.id})
    visit current_path

    click_on "complete-#{task_to_complete.id}"

    expect(page).to have_content(
                      "Current Task Due Finish / Cancel #{second_task.details} #{formatted_date(second_task.due_date)} Completed Task Completed Early? Actions" +
                        " #{task_to_complete.details} #{formatted_date(Date.today)}"
                    )
  end


end

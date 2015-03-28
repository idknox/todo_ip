class Dashboard
  def initialize(user)
    @user = user
    @tasks = user.tasks
  end

  attr_writer :task

  def new_task
    @task ||= Task.new
  end

  def incomplete_tasks
    @tasks.reject { |task| task.complete }.sort_by { |task| task.due_date }
  end

  def completed_tasks
    @tasks.select { |task| task.complete }.sort_by { |task| task.due_date }
  end
end
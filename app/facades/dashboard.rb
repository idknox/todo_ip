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
    @tasks.reject { |task| task.complete }
  end
end
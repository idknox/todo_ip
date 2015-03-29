class Dashboard
  def initialize(user)
    @user = user
    @tasks = user.tasks
  end

  attr_writer :task

  def new_task
    @task ||= Task.new
  end

  def tasks(filter)
    @tasks.select { |task| task_filter(task)[filter] }.sort_by { |task| task.due_date }
  end

  private

  def task_filter(task)
    {
      current: !task.complete & !task.overdue?,
      complete: task.complete,
      overdue: task.overdue?,
      soon: task.due_soon?
    }
  end
end

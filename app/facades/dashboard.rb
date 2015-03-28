class Dashboard
  def initialize(user)
    @user = user
  end

  attr_writer :task

  def new_task
    @task ||= Task.new
  end
end
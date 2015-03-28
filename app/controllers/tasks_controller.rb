class TasksController < ApplicationController
  def create
    task = Task.new(task_params)
    if task.save
      redirect_to home_path
    else
      @dashboard = Dashboard.new(current_user)
      @dashboard.task = task
      render 'dashboard/show'
    end
  end

  private

  def task_params
    params.require(:task).permit(:details, :due_date)
  end
end
class TaskMailer < ActionMailer::Base
  default from: "taskIP@taskIP.com"

  def reminder(user, tasks)
    @user = user
    @tasks = tasks

    mail to: user.email, subject: "You have tasks due soon!"
  end
end
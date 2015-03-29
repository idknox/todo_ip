namespace :tasks do

  desc "Reminds user of due-soon tasks"
  task :reminder => :environment do
    users = User.all
    users.each do |user|
      soon_tasks = Dashboard.new(user).tasks(:soon)
      TaskMailer.reminder(user, soon_tasks).deliver unless soon_tasks.empty?
    end
  end
end
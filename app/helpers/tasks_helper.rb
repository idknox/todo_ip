module TasksHelper
  def formatted_date(date)
    date.strftime('%A %B %e') if date
  end
end
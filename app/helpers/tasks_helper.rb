module TasksHelper
  def formatted_date(date)
    date.strftime('%A %B %e') if date
  end

  def formatted_days(days)
    if days == 1
      "1 day"
    else
      "#{days} days"
    end
  end
end
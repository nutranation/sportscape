module ApplicationHelper
  def timestamp_get(session)
    session[:date][:year].to_s+session[:date][:month].to_s+session[:date][:day].to_s
  end
  def am_or_pm(time=Time.now.in_time_zone('Eastern Time (US & Canada)').hour)
    if (time.hour.to_f)/12 > 1
      hour=time.hour-12+1
      am_pm="PM"
    elsif(time.hour.to_f)/12 == 1
      hour=time.hour+1
      am_pm="PM"
    else
      hour=time.hour+1
      am_pm="AM"
    end
    hour.to_s+" #{am_pm}"
  end
end

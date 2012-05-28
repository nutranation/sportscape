module ApplicationHelper
  def timestamp_get(session)
    session[:date][:year].to_s+session[:date][:month].to_s+session[:date][:day].to_s
  end
end

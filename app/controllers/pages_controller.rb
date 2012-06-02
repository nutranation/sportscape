class PagesController < ApplicationController
  def index
    if session[:date_total]
      @lag = Time.now.in_time_zone('Eastern Time (US & Canada)')-session[:date_total]
    else
      @lag=0
    end
    if session[:form] and @lag < 3600
      if (session[:lat] ==0.0 and session[:long] ==0.0)
          session[:lat]=Geocoder.search(request.ip)[0].data["latitude"].to_f
          session[:long]=Geocoder.search(request.ip)[0].data["longitude"].to_f        
      end
      @difference= (Time.now.in_time_zone('Eastern Time (US & Canada)').hour-session[:date][:hour_start].to_i)
      id=[0]
      id << 1 if session[:basketball]=="1"
      id << 2 if session[:volleyball]=="1"
      if params[:status] and params[:status] =="active"
        min=Time.now-1.hour
        @venues=Venue.joins("join check_ins c on c.venue_id = venues.id").where("sport_id in(?) and c.created_at >= ? ", id, min).near([session[:lat], session[:long]], 500000, :order => "distance" )
      else
        @venues=Venue.where("sport_id in(?)", id).near([session[:lat], session[:long]], 500000, :order => "distance" )
      end
      @date=Date.parse(session[:date][:year].to_s+"-"+session[:date][:month].to_s+"-"+session[:date][:day].to_s)
      render "feed"
    else
      render "form"
    end
  end
  
  def reg_redirect
    session[:basketball] = params[:basketball]
    session[:volleyball] = params[:volleyball]
    session[:date] ={}
    session[:date_total]=Time.now.in_time_zone('Eastern Time (US & Canada)')
    session[:date][:year] = Time.now.year
    session[:date][:month] = Time.now.month
    session[:date][:day] = Time.now.day
    session[:date][:hour_start] = Time.now.in_time_zone('Eastern Time (US & Canada)').hour
    session[:date][:hour_end] = Time.now.in_time_zone('Eastern Time (US & Canada)').hour
    
    session[:form] = true
    if user_signed_in? and current_user
      redirect_to root_path
    else
      redirect_to new_user_registration_path
    end
  end
  
  def form
    render "form"
  end
  
  def contact  
  end
    
  def about
  end
  def geo_grab
    session[:lat]=params[:lat].to_f
    session[:long]= params[:long].to_f
    render "shared/blank"
  end
end
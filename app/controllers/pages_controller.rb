class PagesController < ApplicationController
  def index
    #session[:form] = false
    if session[:form]
      @difference= (Time.now.hour-session[:date][:hour_start].to_i)
      id=[0]
      id << 1 if session[:basketball]=="1"
      id << 2 if session[:volleyball]=="1"
      @venues=Venue.where("sport_id in(?)", id)
      @date=Date.parse(session[:date][:year]+"-"+session[:date][:month]+"-"+session[:date][:day])
      render "feed"
    else
      render "form"
    end
  end
  
  def reg_redirect
    session[:basketball] = params[:basketball]
    session[:volleyball] = params[:volleyball]
    session[:date] = params[:date]
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
end
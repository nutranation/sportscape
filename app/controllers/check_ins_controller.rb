class CheckInsController < ApplicationController
  def create
    @venue=Venue.find(params[:check_in][:venue_id])
    @type=params[:check_in][:type]
    @check_in = CheckIn.create(:user_id => current_user.id, 
                        :venue_id => params[:check_in][:venue_id],
                        :type => params[:check_in][:type],
                        :date => timestamp_get(session),
                        :hour_start => session[:date][:hour_start],
                        :hour_end => session[:date][:hour_end]
                        )
    @check_in.save!
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  
  def timestamp_get(session)
    session[:date][:year].to_s+session[:date][:month].to_s+session[:date][:day].to_s
  end
end
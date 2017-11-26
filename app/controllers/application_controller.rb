class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private 
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def correct_user
    @event = current_user.events.find_by(id: params[:id])
    unless @event
      flash[:danger] = "権限がありません"
      redirect_to root_url
    
    end
  end
  
end

class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @event = current_user.events.build
      @events = current_user.events.order('created_at DESC').page(params[:page])
    end
  end
end

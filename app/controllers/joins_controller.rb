class JoinsController < ApplicationController
  def create
    @event = Event.find_or_initialize_by(id: params[:event_id])
    if params[:type] == "Go"
      current_user.go(@event)
      flash[:success] = "「#{@event.title}」に参加申請をしました"
    end
      redirect_back(fallback_location: root_path)
  end

  def destroy
    @event = Event.find(params[:event_id])
    if params[:type] == "Go"
      current_user.ungo(@event)
      flash[:success] = "「#{@event.title}」の参加をキャンセルしました"
    end
    redirect_back(fallback_location: root_path)
  end

end

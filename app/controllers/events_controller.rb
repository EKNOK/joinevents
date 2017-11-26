class EventsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :destroy, :update]
  
  
  def new
    @event = Event.new
    @word = "create"
  end

  def create
    @event = current_user.events.new(event_params)
    @event.term = Time.zone.local(params[:event]["term(1i)"].to_i,
                                  params[:event]["term(2i)"].to_i,
                                  params[:event]["term(3i)"].to_i,
                                  params[:event]["term(4i)"].to_i,
                                  params[:event]["term(5i)"].to_i)
    if @event.save
      flash[:success] = "イベントを作成しました"
      redirect_to @event
    else
      flash[:danger] = "イベントの作成に失敗しました"
      render 'new'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "イベントを削除しました"
    redirect_back(fallback_location: root_url)
  end

  def edit
    @event = Event.find(params[:id])
    @word = "Edit"
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "イベントを編集しました"
      redirect_to @event
    else
      flash[:danger] = "編集に失敗しました"
      render :edit
    end
  end
  
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :content, :pick, :term)
  end
  
  def join_user_connect
    @event = current_user.events.find_by(params[:id])
    if @event
      flash[:dender] = "あなたは参加者です"
      redirect_to @event
    end
  end
  
end

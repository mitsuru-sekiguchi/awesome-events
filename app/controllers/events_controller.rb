class EventsController < ApplicationController
  skip_before_action :authenticate, only: :show
  before_action :authenticate_userinfo, only: [:new, :create, :edit, :update, :destroy]
  before_action :delete_flag_event, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:edit, :update, :destroy]

  def show
    @event = Event.find(params[:id])
    @ticket = current_user && current_user.tickets.find_by(event: @event)
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "作成しました"
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "更新しました"
    end
  end

  def destroy
    @event.update(delete_flag: 1)
    redirect_to root_path, notice: "削除しました"
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :place, :image, :remove_image, :content, :start_at, :end_at
    )
  end

  def set_event
    @event = current_user.created_events.find(params[:id])
  end
end


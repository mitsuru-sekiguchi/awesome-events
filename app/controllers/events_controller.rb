class EventsController < ApplicationController
  skip_before_action :authenticate, only: :show
  before_action :authenticate_userinfo, only: [:new, :create, :edit, :update, :destroy]
  before_action :delete_flag_event, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:edit, :update, :destroy]

  def show
    @event = Event.find(params[:id])
    @event_user = EventUser.find_by(params[:id])
    @userinfo = UserInformation.find_by(params[:id])
    @ticket = current_user && current_user.tickets.find_by(event: @event)
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  def new
    #EventUserFormクラスのインスタンスの呼び出し
    @event_user_form = EventUserForm.new
  end

  def create
    @event_user_form = EventUserForm.new(event_params)
    @event_user = EventUser.new
    if current_user
      if @event_user_form.valid?
        @event_user_form.save
        redirect_to root_path, notice: "作成しました"
      else
        render :create
      end
    end
  end

  def edit
    @event_user_form = EventUserForm.new(event: @event)
  end

  def update
    @event_user_form = EventUserForm.new(event_params, event: @event)
    if @event_user_form.valid?
      @event_user_form.update_event
      redirect_to @event, notice: "更新しました"
    else
      render :update
    end
  end

  def destroy
    @event.update(delete_flag: 1)
    redirect_to root_path, notice: "削除しました"
  end

  private

  def event_params
    params.require(:event_user_form).permit(
      :name, :place, :image, :remove_image, :content, :start_at, :end_at, :owner_id, user_inoformation_id: []
    ).merge(owner_id: current_user.id)
  end

  # 自身のIDに対応するイベントを取得するメソッド
  def set_event
    if current_user
      event_id = EventUser.where(owner_id: current_user.id, event_id: params[:id]).first
      @event = Event.find(event_id.event_id)
      if @event.nil?
        redirect_to event_path, alert: "権限がありません"
      end
    else
      redirect_to root_path
    end
  end
end


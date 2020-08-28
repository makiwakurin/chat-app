class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save 
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      # 全てのメッセージ情報に紐づくユーザー情報を
      # includes(:user)と記述する事でユーザー情報を一度のアクセスでまとめて
      # 取得できる。
      render :index
    end
  end

  private

 def message_params
   params.require(:message).permit(:content).merge(user_id: current_user.id)
 end
end

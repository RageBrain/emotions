class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      redirect_to chat_rooms_path, notice: 'Chat room created'
    else
      render :new
    end
  end

  def send_emotions
    unless params[:emotion] == ''
      ActionCable.server.broadcast "chat_rooms_#{params[:room]}_channel",
                                   emotion: params[:emotion]
    else
      p params[:emotion]
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
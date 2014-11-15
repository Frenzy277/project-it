class MessagesController < ApplicationController
  before_action :require_user
  before_action :set_message, only: [:show, :destroy]

  def index
    current_user.mark_unread_messages!
    @messages = current_user.messages
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    # Format JS
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    
    if @message.save

    else
      render :new
    end    
  end

  def destroy
    #@message.destroy
  end

  private

    def message_params
      params.require(:message).permit(:body, :recipient_id)
    end

    def set_message
      @message = Message.find(params[:id])
    end

end
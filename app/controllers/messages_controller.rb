class MessagesController < ApplicationController
  before_action :require_user
  before_action :set_message, only: [:read, :destroy]
  before_action :set_unread_read, only: [:index, :read, :destroy]

  def index
    current_user.mark_unviewed_messages!
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.save
    @unread_messages = current_user.unread_messages

    respond_to do |format|
      format.html do
        if @message.valid?
          flash[:success] = "Message sent."
        else
          flash[:danger] = "Message body can not be blank."
        end
        redirect_to :back
      end
      format.js
    end
  end

  def read
    @message.update(read: params[:read])

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render 'messages/refresh' }
    end
  end

  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render 'messages/refresh' }
    end
  end

  private

    def message_params
      params.require(:message).permit(:body, :recipient_id)
    end

    def set_message
      @message = Message.find(params[:id])
    end

    def set_unread_read
      @unread_messages = current_user.unread_messages
      @read_messages = current_user.read_messages
    end

end
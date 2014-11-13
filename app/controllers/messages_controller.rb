class MessagesController < ApplicationController
  before_action :require_user
  before_action :set_message, only: [:show, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
    #@message.destroy
  end

  private

    def message_params
      params.require(:message).permit(:body)
    end

    def set_message
      @message = Message.find(params[:id])
    end

end
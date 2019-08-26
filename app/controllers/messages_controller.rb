class MessagesController < ApplicationController
  before_action :get_messages

  def index
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def get_messages
    @messages = Message.for_display
    @message  = current_user.messages.build
  end

  def message_params
    params.require(:message).permit(:content)
  end
end

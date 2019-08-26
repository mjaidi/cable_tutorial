class MessagesController < ApplicationController
  before_action :get_messages

  def index
    @message  = @conversation.messages.new
  end

  def create
     @message = @conversation.messages.new(message_params)
    if @message.save
      ActionCable.server.broadcast "conversation_#{@conversation.id}",
                                   message:  render_message(@message),
                                   conversation: @conversation.id
    else
      render 'index'
    end
  end

  private

  def get_messages
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
  end

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
    def render_message(message)
      render(partial: 'message', locals: { message: message })
    end
end

class MessagesController < ApplicationController

  def create
    @creek = Creek.find(params[:creek_id])
    @message = Message.new(set_params)
    @message.creek = @creek
    @message.user = current_user
    if @message.save!
      CreekChannel.broadcast_to(
        @creek,
        render_to_string(partial: "messages", locals: { message: @message })
      )
      redirect_to creek_path(@creek, anchor: "message-#{@message.id}")
    else
      render "creeks/show"
    end
  end

  def set_params
    params.require(:message).permit(:content)
  end

end

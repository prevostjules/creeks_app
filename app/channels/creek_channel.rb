class CreekChannel < ApplicationCable::Channel
  def subscribed
    creek = Creek.find(params[:id])
    stream_for creek
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class TicketsController < ApplicationController

  def create
    @ticket = Ticket.new
    @ticket.payment_status = true
    @ticket.user = current_user
    @creek = Creek.find(params[:creek_id])
    @ticket.creek = @creek
    @ticket.save!
    redirect_to creek_path(@creek)
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to user_path(current_user)
  end
end

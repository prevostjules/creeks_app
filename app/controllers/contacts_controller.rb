class ContactsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params_contact)
    if @contact.save
      # mail = ContactTestMailer.with(contact: @contact).message_test
      # mail.deliver_now
      flash[:alert] = "Merci pour votre email, nous vous recontacterons dans les plus brefs délais."
      redirect_to root_path
    else
      render :new
    end
  end

  # def thanks
  # end

  private

  def params_contact
    params.require(:contact).permit(:nom, :prenom, :email, :telephone, :message)
  end
end

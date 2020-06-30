class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params_contact)
    if @contact.save
      mail = ContactTestMailer.with(contact: @contact).message_test
      mail.deliver_now
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

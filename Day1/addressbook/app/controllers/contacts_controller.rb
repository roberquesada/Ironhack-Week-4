class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def create
    contact = Contact.new(
      :name => params[:contact][:name],
      :address => params[:contact][:address],
      :phone => params[:contact][:phone],
      :email => params[:contact][:email]
    )

    render(:text => params.inspect)
  end
end

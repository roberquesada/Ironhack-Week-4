class Bid < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  def self.get_user_id_from_email(params)
    user_email = params[:user][:email]
    user = User.find_by(email: user_email)
    params[:bid][:user_id] = user.id
  end

end

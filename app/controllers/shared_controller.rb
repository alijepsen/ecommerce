class SharedController < ApplicationController
  skip_before_action :authenticate_user!
  def home
  end

  def about
  end

  def create
    subscriber = Subscriber.create(subscriber_params)
    SignupMailer.new_signup(subscriber).deliver
    redirect_to root_path
  end

 private
  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end

class UsersController < ApplicationController
  def show
    @creek = Creek.new
    @user = User.find(params[:id])
    @link_to_google_auth = "https://accounts.google.com/o/oauth2/auth?client_id=#{ENV['CLIENT_ID']}&redirect_uri=#{ENV['REDIRECT_URI']}&scope=https://www.googleapis.com/auth/youtube&response_type=code&access_type=offline"
  end
end

class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @creek = Creek.new
    @user = User.find(params[:id])
    @link_to_google_auth = "https://accounts.google.com/o/oauth2/auth?client_id=#{ENV['CLIENT_ID']}&redirect_uri=#{ENV['REDIRECT_URI']}&scope=https://www.googleapis.com/auth/youtube&response_type=code&access_type=offline"
    @tickets = @user.tickets
    pictures = ["img%20projet/river%20imgs/michael-niessl-x_gyAYzyeQA-unsplash_kffnvh", "img%20projet/river%20imgs/kazuend-cCthPLHmrzI-unsplash_mlt6ys"]
    @banner = pictures.sample

  end
end

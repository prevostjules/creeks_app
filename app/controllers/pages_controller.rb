class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index, :team ]
  require "uri"
  require "net/http"

  def home
    @creeks = Creek.last(4)
    @streamers = User.where(role: "streamer")
    if params[:code].present?
      results = call_google_api
      if current_user.description.nil?
        current_user.update!(access_token: results["access_token"], refresh_token: results["refresh_token"], description: "Description à venir")
      else
        current_user.update!(access_token: results["access_token"], refresh_token: results["refresh_token"])
      end
    end
  end

  def index
    if params[:query].present?
      @creeks = Creek.search(params[:query])
      @users = User.search(params[:query])
      @users = @users.select{ |user| user.role == "streamer"}
    elsif params[:category].present?

      category = Category.find_by(name: params[:category])
      @creeks = Creek.all.select{ |creek| creek.category == category}
    else
      @users = User.all.select{ |user| user.role == "streamer"}
    end
  end

  def team
  end

  private

  def call_google_api
    url = URI("https://accounts.google.com/o/oauth2/token")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/x-www-form-urlencoded"
    request.body = "code=#{params[:code]}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&redirect_uri=#{ENV['REDIRECT_URI']}&grant_type=authorization_code&Content-Type=application/x-www-form-urlencoded"

    response = https.request(request)
    results = response.read_body
    results_as_hash = JSON.parse(results)
  end

end

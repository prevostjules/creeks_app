class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  require "uri"
  require "net/http"

  def home
    if params[:code].present?
      results = call_google_api
      p results
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
    end
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

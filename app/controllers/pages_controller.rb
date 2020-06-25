class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  require "uri"
  require "net/http"

  def home
    if params[:code].present?
      results = call_google_api
      p results
      stream_params = create_stream_params(results["access_token"])
      if current_user.description.nil?
        current_user.update!(access_token: results["access_token"], refresh_token: results["refresh_token"], description: "Description à venir", stream_id: stream_params["id"])
      else
        current_user.update!(access_token: results["access_token"], refresh_token: results["refresh_token"], stream_id: stream_params["id"])
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

  def create_stream_params(access_token)
    url = URI("https://www.googleapis.com/youtube/v3/liveStreams?part=snippet%2Ccdn%2CcontentDetails%2Cstatus&key=#{ENV['API_KEY']}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Bearer #{access_token}"
    request["Accept"] = "application/json"
    request["Content-Type"] = "application/json"
    request.body = "{\"snippet\":{\"title\":\"CreeksApp\",\"description\":\"#{current_user.description}\",\"isDefaultStream\":true},\"cdn\":{\"frameRate\":\"30fps\",\"ingestionType\":\"rtmp\",\"resolution\":\"720p\"},\"contentDetails\":{\"isReusable\":false}}"

    response = https.request(request)
    JSON.parse(response.read_body)
  end

end

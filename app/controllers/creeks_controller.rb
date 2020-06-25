class CreeksController < ApplicationController
  before_action :set_creek, only: [:show, :edit, :update, :destroy]
  require 'net/http'
  require 'uri'
  def show
  end

  def new
    @creek = Creek.new
  end

  def create
    @creek = Creek.new(set_params)
    @creek.user = current_user
    check_credentials
    results = call_youtube_api
    results = JSON.parse(results)
    p results
    @creek.iframe = results["contentDetails"]["monitorStream"]["embedHtml"]
    if @creek.save!
      redirect_to creek_path(@creek)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @creek.update(set_params)
    if @creek.save!
      redirect_to creek_path(@creek)
    else
      render :edit
    end
  end

  def destroy
    @creek.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_params
    params.require(:creek).permit(:title, :description, :scheduledStartTime, :scheduledEndTime, :price, :capacity)
  end

  def set_creek
    @creek = Creek.find(params[:id])
  end

  def call_youtube_api
    access_token = current_user.access_token
    url = URI("https://www.googleapis.com/youtube/v3/liveBroadcasts?part=snippet%2CcontentDetails%2Cstatus&key=#{ENV['API_KEY']}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Bearer #{access_token}"
    request["Accept"] = "application/json"
    request["Content-Type"] = "application/json"
    request.body = "{\"snippet\":{\"title\":\"#{@creek.title}\",\"scheduledStartTime\":\"#{@creek.scheduledStartTime}:00.0Z\",\"scheduledEndTime\":\"#{@creek.scheduledEndTime}:00.0Z\"},\"contentDetails\":{\"enableClosedCaptions\":true,\"enableContentEncryption\":true,\"enableDvr\":true,\"enableEmbed\":true,\"recordFromStart\":true,\"startWithSlate\":true},\"status\":{\"privacyStatus\":\"unlisted\"}}"

    response = https.request(request)
    p response.read_body
    response.read_body
  end

  def check_credentials
    access_token = current_user.access_token
    url = URI("https://www.googleapis.com/youtube/v3/channels?part=id&mine=true")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer #{access_token}"

    response = https.request(request)
    if JSON.parse(response.read_body).key?("error")
      url = URI("https://accounts.google.com/o/oauth2/token")

      https = Net::HTTP.new(url.host, url.port);
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = "application/x-www-form-urlencoded"
      request["Cookie"] = "GAPS=1:Y1vNLoVUz49hu5_j8hDhxnAlOwX9NQ:XgiLKsUk1JSIdb5z; __Host-GAPS=1:Y1vNLoVUz49hu5_j8hDhxnAlOwX9NQ:XgiLKsUk1JSIdb5z"
      request.body = "client_id=206719754391-rer1a7fdjuf8g80sq4l1ab55bptsc2n7.apps.googleusercontent.com&client_secret=I8KNI8zDhCxf5ysZ6lgEu1i7&refresh_token=1//03ndkIduieTfqCgYIARAAGAMSNwF-L9Iray8IIkWDP3xD1R4htBvo2LXBuFT9Pap91OluntyREiwcnkoe6B2Mmq9x_0J6tOLDA48&grant_type=refresh_token&response_type=code&scope=https%3A//www.googleapis.com/auth/youtube&redirect_uri=http%253A//localhost%253A3000"

      response = https.request(request)
      puts response.read_body
      results = JSON.parse(response.read_body)
      current_user.update!(access_token: results["access_token"])
    else
      return true
    end
  end
end

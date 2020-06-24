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
    results = call_youtube_api
    results = JSON.parse(results)
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
    params.require(:creek).permit(:title, :description, :scheduledStartTime, :price)
  end

  def set_creek
    @creek = Creek.find(params[:id])
  end

  def call_youtube_api
    access_token = current_user.access_token

    url = URI("https://www.googleapis.com/youtube/v3/liveBroadcasts?part=snippet%2CcontentDetails%2Cstatus&key=AIzaSyDAKRfsEDRrWm-GjMCePa_jzyDUXWOph9U")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Bearer #{access_token}"
    request["Accept"] = "application/json"
    request["Content-Type"] = "application/json"
    request.body = "{\"snippet\":{\"title\":\"Test broadcast\",\"scheduledStartTime\":\"2020-06-27T05:06:07.0Z\",\"scheduledEndTime\":\"2020-06-28T05:06:07.0Z\"},\"contentDetails\":{\"enableClosedCaptions\":true,\"enableContentEncryption\":true,\"enableDvr\":true,\"enableEmbed\":true,\"recordFromStart\":true,\"startWithSlate\":true},\"status\":{\"privacyStatus\":\"unlisted\"}}"

    response = https.request(request)
    response.read_body
  end
end

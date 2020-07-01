class CreeksController < ApplicationController
  before_action :set_creek, only: [:show, :edit, :update, :destroy]
  require 'net/http'
  require 'uri'

  def show
    @message = Message.new
    @embed_link = "https://www.youtube.com/embed/#{@creek.id_broadcast}?autoplay=1&modestbranding=1&iv_load_policy=3&controls=0"
    @tickets = @creek.tickets.where(payment_status: true)
    @users = @creek.users
    if !@creek.capacity.nil?
      @remain_capacity = @creek.capacity - @tickets.count
    end
  end

  def new
    @creek = Creek.new
  end

  def create
      @creek = Creek.new(set_params)
      @creek.user = current_user
      if @creek.save!
        check_credentials
        results = JSON.parse(call_youtube_api)
        @creek.id_broadcast = results["id"]
        @creek.update!(id_broadcast: results["id"])
        link_broadcast_to_stream(results["id"], current_user.stream_id)
        flash[:alert] = results
        redirect_to creek_path(@creek)
      else
        render :new
      end
  end

  def edit
  end

  def update
    if check_credentials && @creek.update!(set_params)
      delete_broadcast
      results = JSON.parse(call_youtube_api)
      @creek.id_broadcast = results["id"]
      @creek.update!(id_broadcast: results["id"])
      link_broadcast_to_stream(results["id"], current_user.stream_id)
      flash[:alert] = results
      redirect_to creek_path(@creek)
    else
      render :edit
      flash[:alert] = results
    end
  end

  def destroy
    check_credentials
    delete_broadcast
    @creek.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_params
    params.require(:creek).permit(:title, :description, :scheduledStartTime, :duration, :price, :capacity, :photo, :category_id)
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
    request.body = "{\"snippet\":{\"title\":\"#{@creek.title}\",\"scheduledStartTime\":\"#{@creek.scheduledStartTime}:00.0+02:00\",\"description\":\"#{@creek.description}\"},\"contentDetails\":{\"enableClosedCaptions\":false,\"enableContentEncryption\":true,\"enableDvr\":true,\"enableEmbed\":true,\"recordFromStart\":true,\"startWithSlate\":true,\"latencyPreference\":\"ultraLow\",\"monitorStream\":{\"enableMonitorStream\":false},\"enableAutoStart\":true,\"enableAutoStop\":true},\"status\":{\"privacyStatus\":\"unlisted\",\"selfDeclaredMadeForKids\":true,\"lifeCycleStatus\":\"ready\"}}"
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
      request.body = "client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&refresh_token=#{current_user.refresh_token}&grant_type=refresh_token&response_type=code&scope=https%3A//www.googleapis.com/auth/youtube&redirect_uri=#{ENV['REDIRECT_URI']}"

      response = https.request(request)
      puts response.read_body
      results = JSON.parse(response.read_body)
      current_user.update!(access_token: results["access_token"])
    else
      return true
    end
  end

  def link_broadcast_to_stream(broadcast_id, stream_id)

    url = URI("https://www.googleapis.com/youtube/v3/liveBroadcasts/bind?id=#{broadcast_id}&part=snippet&streamId=#{stream_id}&key=#{ENV['API_KEY']}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Bearer #{current_user.access_token}"
    request["Accept"] = "application/json"

    response = https.request(request)
    p response.read_body
    response.read_body
  end

  def delete_broadcast
    url = URI("https://www.googleapis.com/youtube/v3/liveBroadcasts?id=#{@creek.id_broadcast}&key=#{ENV['API_KEY']}")
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Delete.new(url)
    request["Authorization"] = "Bearer #{current_user.access_token}"
    request["Accept"] = "application/json"

    response = https.request(request)
    response.read_body
  end

  # def create_stream_params
  #   url = URI("https://www.googleapis.com/youtube/v3/liveStreams?part=snippet%2Ccdn%2CcontentDetails%2Cstatus&key=#{ENV['API_KEY']}")

  #   https = Net::HTTP.new(url.host, url.port)
  #   https.use_ssl = true

  #   request = Net::HTTP::Post.new(url)
  #   request["Authorization"] = "Bearer #{current_user.access_token}"
  #   request["Accept"] = "application/json"
  #   request["Content-Type"] = "application/json"
  #   request.body = "{\"snippet\":{\"title\":\"CreeksApp\",\"description\":\"#{current_user.description}\"},\"cdn\":{\"frameRate\":\"30fps\",\"ingestionType\":\"rtmp\",\"resolution\":\"720p\"},\"contentDetails\":{\"isReusable\":true}}"

  #   response = https.request(request)
  #   JSON.parse(response.read_body)
  # end
end

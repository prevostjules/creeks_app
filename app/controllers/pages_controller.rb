class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  require "uri"
  require "net/http"

  def home
    if params[:code].present?
      url = URI("https://accounts.google.com/o/oauth2/token")

      https = Net::HTTP.new(url.host, url.port);
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = "application/x-www-form-urlencoded"
      request.body = "code=#{params[:code]}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&redirect_uri=http%3A//localhost%3A3000&grant_type=authorization_code&Content-Type=application/x-www-form-urlencoded"

      response = https.request(request)
      results = response.read_body
      results_as_hash = JSON.parse(results)
      current_user.update!(access_token: results_as_hash["access_token"], refresh_token: results_as_hash["refresh_token"])
    end
  end
end

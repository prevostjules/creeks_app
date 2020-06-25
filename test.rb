require "uri"
require "net/http"

access_token = current_user.access_token
url = URI("https://www.googleapis.com/youtube/v3/liveStreams?part=snippet%2Ccdn%2CcontentDetails%2Cstatus&key=#{ENV['API_KEY']}")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Authorization"] = "Bearer #{access_token}"
request["Accept"] = "application/json"
request["Content-Type"] = "application/json"
request.body = "{\"snippet\":{\"title\":\"CreeksApp\",\"description\":\"#{current_user.description}\"},\"cdn\":{\"frameRate\":\"30fps\",\"ingestionType\":\"rtmp\",\"resolution\":\"720p\"},\"contentDetails\":{\"isReusable\":true}}"

response = https.request(request)
puts response.read_body


----





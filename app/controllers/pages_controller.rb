class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  include HTTParty
  def home
KEY
VALUE
DESCRIPTION
        headers = {
          "Content-Type" => "application/x-www-form-urlencoded"
        }
        body = {
          code: '4/1AEWIy05Y-5Ksg09pqJRbbcqMLIkKre9UsHea_j_Tjox_PFIBUrOw8QUVMLEkJJJPVjijo6HVp411CSPpS3XVsc',
          client_id: '206719754391-rer1a7fdjuf8g80sq4l1ab55bptsc2n7.apps.googleusercontent.com',
          client_secret: 'EgetGE2RJCFomBQu3N3cV5hP',
          redirect_uri: 'http://localhost:3000',
          grant_type: 'authorization_code'
        }.to_json

      result = HTTParty.post('https://accounts.google.com/o/oauth2/token',
        :headers => headers,
        :body => body)
4/1AEWIy05Y-5Ksg09pqJRbbcqMLIkKre9UsHea_j_Tjox_PFIBUrOw8QUVMLEkJJJPVjijo6HVp411CSPpS3XVsc
      byebug
      puts result
  end
end

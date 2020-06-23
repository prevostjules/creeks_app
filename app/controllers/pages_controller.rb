class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  include HTTParty
  def home
  end
end

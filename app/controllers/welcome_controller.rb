class WelcomeController < ApplicationController
    #before_filter :authenticate_user!

  def index
      @last_photo = Photo.last
  end
end

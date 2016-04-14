class UsersController < ApplicationController

    # GET /users
    def index
    end

    # GET /users/{id}
    def show
        @user = current_user
        @albums = @user.albums
    end

end

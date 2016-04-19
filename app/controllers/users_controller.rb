class UsersController < ApplicationController

    # GET /users
    def index
    end

    # GET /users/{id}
    def show
        # FIXME: et si je ne suis pas loggué?
        @user = current_user
        # FIXME: problème du SELECT N+1
        @albums = @user.albums
    end

end

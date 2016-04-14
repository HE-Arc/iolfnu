class AlbumsController < ApplicationController
    before_action :authenticate_user!, :except => [:show, :index]

    # GET /user/{user_id}/albums/
    def index
        @user = User.find(params[:user_id])
        @albums = @user.albums

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @albums }
        end
    end

    # GET /user/{user_id}/albums/{id}
    def show
        @user = User.find(params[:user_id])
        @album = @user.albums.find(params[:id])
        @photos = @album.photos

        respond_to do |format|
            format.html # show.html.erb
            format.json{ render json: @album}
        end
    end

    # GET /albums/new
    def new
        @user = current_user
        @album = @user.albums.new

        respond_to do |format|
            format.html
            format.json { render json: @album }
        end
    end

    # GET /albums/{id}/edit
    def edit
        @user = current_user
        @album = @user.albums.find(params[:id])
    end

    # POST /albums
    def create
        @user = current_user
        @album = @user.albums.new(album_params)

        respond_to do |format|
            if @album.save

                if params[:images]
                    params[:images].each { |image|
                        @album.photos.create(image: image)
                    }
                end

                format.html { redirect_to [@user, @album], notice: 'Album was successfully created.' }
                format.json { render json: [@user, @album], status: :created, location: @album }
            else
                format.html { render action: "new" }
                format.json { render json: @album.errors, status: :unprocessable_entity }
            end
        end
    end

    # PUT /albums/{id}
    def update
        @album = Album.find(params[:id])

        respond_to do |format|
            if @album.update_attributes(album_params)
                if params[:images]
                    params[:images].each { |image|
                        @album.photos.create(image: image)
                    }
                end
                format.html { redirect_to @album, notice: 'Album was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @album.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /albums/{id}
    def destroy
        @album = Album.find(params[:id])
        @album.destroy  # album.photos depend on destroy

        respond_to do |format|
            format.html { redirect_to albums_url }
            format.json { head :no_content }
        end
    end

    private
    def album_params
        params.require(:album).permit(:description, :title, :photo)
    end

end

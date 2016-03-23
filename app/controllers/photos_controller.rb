class PhotosController < ApplicationController

    # GET /photos
    def index
        @album = Album.find(params[:album_id])

        @photos = @album.photos

        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @photos }
        end
    end

    # GET /photos/{id}
    def show
        @photo = Photo.find(params[:id])

        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @photos }
        end
    end

    # GET /photos/new
    def new
        @album = Album.find(params[:album_id])
        @photo = @album.photos.build

        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @photo }
        end
    end

    # GET /photos/{id}/edit
    def edit
        @photo = Photo.find(params[:id])
    end

    # POST /photos
    def create
      @photo = Photo.new(params[:photo])

      if @photo.save
        respond_to do |format|
          format.html {
            render :json => [@photo.to_jq_upload].to_json,
            :content_type => 'text/html',
            :layout => false
          }
          format.json {
            render :json => [@photo.to_jq_upload].to_json
          }
        end
      else
        render :json => [{:error => "custom_failure"}], :status => 304
      end
    end

    # PUT /photos/{id}
    def update

      @album = Album.find(params[:album_id])

      @photo = @album.photos.find(params[:id])

      respond_to do |format|
        if @photo.update_attributes(photo_params)
          format.html { redirect_to album_path(@album), notice: 'Photo was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @photo.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /photos/{id}
    def destroy
        @photo = Photo.find(params[:id])
        @photo.destroy

        respond_to do |format|
          format.html { redirect_to root_path }
          format.js
        end
    end

    private
    def photo_params
        params.require(:photo).permit(:title, :description, :album_id, :image)
    end


end

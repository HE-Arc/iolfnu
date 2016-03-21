class PhotosController < ApplicationController
    #before_filter :authenticate_user!

  def show
    @photo = Photo.find(params[:id])
  end

  def new
  end

  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to photos_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_path
  end

  private
      def photo_params
          params.require(:photo).permit(:title, :description, :image)
      end


end

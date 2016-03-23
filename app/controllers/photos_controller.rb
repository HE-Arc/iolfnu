class PhotosController < ApplicationController

  def show
    @photo = Photo.find(params[:id])
  end

  def index
    @photos = Photo.all
  end

  def create
    before_filter :authenticate_user!
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

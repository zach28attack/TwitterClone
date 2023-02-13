class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[create destroy]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.image_derivatives!
    @photo.user_id = current_user.id
    respond_to do |format|
      if @photo.save
        current_user.photos.first.destroy if current_user.photos.count >= 2 #delete previously uploaded image upon new photo upload
        format.html { redirect_to user_path(current_user), notice: "Profile picture successfully changed." }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo was successfully deleted." }
    end
  end

  private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:title, :image, :user_id)
    end
end
class Photo2sController < ApplicationController
  before_action :set_photo2, :only => [:show, :edit, :update, :destroy]

  def index
    @photo2s = Photo2.all
  end

  def new
    @photo2 = Photo2.new
  end

  def create
    @photo2 = Photo2.new(photo2_params)
    if @photo2.save
      redirect_to photo2s_url
    else
      render :new
    end
  end

  def update
    if @photo2.update_attributes(photo2_params)
      redirect_to photo2_path(@photo2)
    else
      render :edit
    end
  end

  def destroy
    @photo2.destroy

    redirect_to photo2s_url
  end

  private

  def set_photo2
    @photo2 = Photo2.find(params[:id])
  end

  def photo2_params
    params.require(:photo2).permit(:title, :date, :description, :file_location)
  end
end

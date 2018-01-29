class Api::V1::PhotosController < ApiController
  def index
    @photos = Photo2.all
    # 因在 config/routes.rb 裡有設定 defaults: {format: :json}，所以就算不用 render 來執行回傳參數，也還是會回傳 JSON
  end

  def show
    @photo = Photo2.find_by(id: params[:id]) # 找不到物件內容時，會回傳 nil，而不是拋出 Error 讓你的程式壞掉。
    if !@photo
      render json: {
        message: "Can't find the photo!",
        status: 400
      }
    else
      render "api/v1/photos/show"
    end
  end

  def create
    @photo = Photo2.new(photo_params)
    if @photo.save
      render json: {
        message: "Photo created successfully!",
        result: @photo
      }
    else
      render json: {
        errors: @photo.errors
      }
    end
  end

  def update
    @photo = Photo2.find_by(id: params[:id])
    if @photo.update(photo_params)
      render json: {
        message: "Photo updated successfully!",
        result: @photo
      }
    else
      render json: {
        errors: @photo.errors
      }
    end
  end

  def destroy
    @photo = Photo2.find_by(id: params[:id])
    @photo.destroy
    render json: {
      message: "Photo destroy successfully!"
    }
  end

  private

  def photo_params
    params.permit(:title, :date, :description, :file_location)
  end
end

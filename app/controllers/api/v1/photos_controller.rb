class Api::V1::PhotosController < ApiController
  def index
    @photos = Photo2.all

    # 因在 config/routes.rb 裡有設定 defaults: {format: :json}，所以就算不用 render 來執行回傳參數，也還是會回傳 JSON
    render json: {
      data: @photos.map do |photo|
        {
          title: photo.title,
          date: photo.date,
          description: photo.description
        }
      end
    }
  end

  def show
    @photo = Photo2.find_by(id: params[:id]) # 找不到物件內容時，會回傳 nil，而不是拋出 Error 讓你的程式壞掉。
    if !@photo
      render json: {
        message: "Can't find the photo!",
        status: 400
      }
    else
      render json: {
        title: @photo.title,
        date: @photo.date,
        description: @photo.description
      }
    end
  end
end

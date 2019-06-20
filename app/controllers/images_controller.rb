class ImagesController < ApplicationController
  def index
    @images = Image.where(user_id: current_user.id)
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user
    if @image.save
      redirect_to statistic_path(@image.statistic), notice: 'Image successfully creted and analysed'
    else
      render 'home/index'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path, notice: 'Image was deleted'
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end
end

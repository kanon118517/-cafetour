class CafesController < ApplicationController
  def new
    @cafe = Cafe.new

  end

  def create
    cafe = Cafe.new(cafe_params)
    if (current_user.email != 'guest@example.com') && cafe.save
      redirect_to cafes_path
    else
      redirect_to cafes_path
    end
  end

  def index
    @cafes = params[:tag_id].present? ? Tag.find(params[:tag_id]).cafes : Cafe.all
  end

  def show
    @cafe = Cafe.find(params[:id])
  end

  def edit
    @cafe = Cafe.find(params[:id])
  end

  def update
    cafe = Cafe.find(params[:id])
    if (current_user.email != 'guest@example.com') && cafe.update(cafe_params)
      redirect_to cafes_path
    else
      redirect_to cafes_path
    end
  end

  private

  def cafe_params
    params.require(:cafe).permit(:cafe_name,:address, tag_ids: [])
  end


end

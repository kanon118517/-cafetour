class Admin::CafeController < ApplicationController

  def index
    @cafes = Cafe.all
  end

  def show
    @cafe = Cafe.find(params[:id])
  end

  def destroy
    cafe = Cafe.find(params[:id])
    cafe.destroy
    redirect_to admin_cafes_path
  end


end

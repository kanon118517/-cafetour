class Admin::PrefectturesController < ApplicationController
  def new
    @prefecttures = Prefectture.new
  end

  def create
    prefecttures = Prefectture.new(prefectture_params)
    prefecttures.save
    redirect_to admin_prefecttures_path
  end

  def index
    @prefectture = Prefectture.all
  end

private

  def prefectture_params
    params.require(:prefectture).permit(:name)
  end


end

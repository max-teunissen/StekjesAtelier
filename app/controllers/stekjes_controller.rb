# frozen_string_literal: true

# stekjes controller
class StekjesController < ApplicationController
  def index
    @stekjes = Stekje.all
  end

  def new
    @stekje = Stekje.new # needed to instantiate the form_for
  end

  def create
    @stekje = Stekje.new(stekje_params)
    @stekje.save
    # Will raise ActiveModel::ForbiddenAttributesError

    redirect_to stekjes_path
  end

  def edit
    @stekje = Stekje.find(params[:id])
  end

  def update
    @stekje = Stekje.find(params[:id])
    @stekje.update(restaurant_params)

    redirect_to stekje_path(@stekje)
  end

  def destroy
    @stekje = Stekje.find(params[:id])
    @stekje.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to allstekjes_path, notice: 'Het stekje is verwijderd'
  end

  def show
    @stekje = Stekje.find(params[:id])
  end

  private

  def stekje_params
    params.require(:stekje).permit(:name, :image, :category, :size,
                                   :description, :price, :care, :instock, :file)
  end
end

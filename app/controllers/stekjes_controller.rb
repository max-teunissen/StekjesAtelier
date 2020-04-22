# frozen_string_literal: true

# stekjes controller
class StekjesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @stekjes = Stekje.all
  end

  def new
    @stekje = Stekje.new # needed to instantiate the form_for
    @categories = Category.all.map{ |c| [c.name, c.id ] }
  end

  def create
    # Will raise ActiveModel::ForbiddenAttributesError
    @stekje = Stekje.new(stekje_params)
    @stekje.category_id = params[:category_id]

    if @stekje.save
       redirect_to(@stekje, notice: 'Stekje was succesfully created.')
      else
        render json: stekje.errors, status: :unprocessable_entity
    end
  end

  def edit
    @stekje = Stekje.find(params[:id])
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
    @stekje = Stekje.find(params[:id])
    @stetje.category_id = params[:category_id]
    @stekje.update(stekje_params)

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

  def plantjes; end

  private

  def stekje_params
    params.require(:stekje).permit(:name, :image, :category, :size,
                                   :description, :price, :care, :instock,
                                   :file, :category_id)
  end
end

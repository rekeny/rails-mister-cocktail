class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      @cocktails = Cocktail.all
      @cocktail = Cocktail.new
      render :index
    end
  end

  private

  def strong_params
    params.require(:cocktail).permit(:name, :photo)
  end
end

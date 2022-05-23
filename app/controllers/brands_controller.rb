class BrandsController < ApplicationController
  def show
    @brand = Brand.find(params[:id])
    @reviews = @brand.reviews.order(updated_at: "DESC")
  end

  def new
    @brewery = Brewery.find(params[:brewery_id])
    @brand = Brand.new
  end

  def create
    @brewery = Brewery.find(params[:brewery_id])
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to action: :show, id: @brand
    else
      render :new
    end
  end

  private
  def brand_params
    params.require(:brand).permit(:name).merge(brewery_id: @brewery.id)
  end
end

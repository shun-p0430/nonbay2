class ReviewsController < ApplicationController
  before_action :set_brand, only: [:new, :create]

  def index
    @reviews = Review.includes(:user).order("updated_at DESC").limit(15)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to controller: :brands, action: :show, id: params[:brand_id]
      aroma = Review.where(brand_id: @brand.id).average(:aroma)
      impression = Review.where(brand_id: @brand.id).average(:impression)
      taste = Review.where(brand_id: @brand.id).average(:taste)
      afterglow = Review.where(brand_id: @brand.id).average(:afterglow)
      Brand.where(id: @brand.id).update(aroma: aroma, impression: impression, taste: taste, afterglow: afterglow)
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:aroma, :impression, :taste, :afterglow, :comment, :image).merge(user_id: current_user.id, brand_id: params[:brand_id])
  end

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end
end

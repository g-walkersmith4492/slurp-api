# frozen_string_literal: true

class ReviewsController < OpenReadController
  before_action :set_review, only: %i[update destroy]

  # GET /wines
  def index
    @reviews = Review.all

    render json: @reviews
  end

  # GET /wines/1
  def show
    @review = Review.find(params[:id])
    render json: @review
  end

  # POST /wines
  def create
    @review = current_user.reviews.new(review_params)

    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wines/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wines/1
  def destroy
    @review.destroy
  end

  def yelp_search
    search_string = params.require(:search)
    render json: HTTParty.get("https://api.yelp.com/v3/businesses/search?limit=50&term=Ramen&location=#{search_string}", :headers => { "Authorization" => "Bearer #{ENV["YELP_KEY"]}"})
  end

  def yelp_search_specs
    search_string = params.require(:search)
    search_specs = params.require(:specs)
    puts(search_specs)
    render json: HTTParty.get("https://api.yelp.com/v3/businesses/search?limit=50&term=Ramen&location=#{search_string}&sort_by=#{search_specs}", :headers => { "Authorization" => "Bearer #{ENV["YELP_KEY"]}"})
  end

  def yelp_search_price
    search_string = params.require(:search)
    search_num = params.require(:priceNum)
    render json: HTTParty.get("https://api.yelp.com/v3/businesses/search?limit=50&term=Ramen&location=#{search_string}&price=#{search_num}", :headers => { "Authorization" => "Bearer #{ENV["YELP_KEY"]}"})
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = current_user.reviews.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:name, :ramen_type, :price, :rating, :location, :comments)
    end
end

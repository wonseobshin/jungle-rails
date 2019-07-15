class ReviewsController < ApplicationController
    def create
        puts params
        @review = Review.new(review_params)
        @review.product = Product.find_by(:id => params[:product_id])
        @review.user = current_user
        @review.save!
        redirect_to product_path(params[:product_id])
    end
    
    private

    def review_params
        params.require(:review).permit(:description, :rating)
    end
end

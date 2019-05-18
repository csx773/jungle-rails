class ReviewsController < ApplicationController
    before_filter :authorize

    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(review_params)
        @review.user = current_user
        @review.save!
        redirect_to product_path(@product)
    end

    def destroy
        raise "in review destory action"
    end

    private
    
    def review_params
        params.require(:review).permit(
            :description,
            :rating
        )
    end

end

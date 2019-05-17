class Admin::CategoriesController < ApplicationController
    
    http_basic_authenticate_with name: ENV['username'].to_s, password: ENV['password'].to_s

    def index
        @categories = Category.order(id: :desc).all 
    end
    
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
          redirect_to [:admin, :categories], notice: 'New category created!'
        else
          render :new
        end
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

end

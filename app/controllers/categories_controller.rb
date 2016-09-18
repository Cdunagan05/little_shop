class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_name(params[:category_name])
    render 'shared/error' unless @category
  end
end

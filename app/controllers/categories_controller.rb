class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_name(params[:category_name])
    if @category
    else
      render 'shared/error'
    end
  end

end

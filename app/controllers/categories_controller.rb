class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_name(params[:category_name])
  end

end

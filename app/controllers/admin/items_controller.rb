class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      @category = Category.find_or_create_by(name: params[:categories][:name])
      @category.items << @item
      redirect_to item_path(@item)
    else
      flash.now[:warning] = @item.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title,
                                 :description,
                                 :price,
                                 :image,
                                 categories_attributes: [:name])
  end
end

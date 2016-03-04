class ItemsController < ApplicationController
  def create
    @user = current_user
    @item = @user.items.new(item_params)
    @new_item = Item.new

    if @item.save
      redirect_to @user
    end
  end


private
  def item_params
    params.require(:item).permit(:name)
  end
end

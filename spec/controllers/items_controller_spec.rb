require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  before { User.delete_all }
  before { Item.delete_all }

   before(:each) do
     @user = FactoryGirl.create(:user)
     sign_in @user
     @item = FactoryGirl.create(:item)
     @user.items << @item
   end

   describe "Item #create" do
     it "returns http success" do
       post :create, user_id: @user.id, item: {name: "Item!"}
       expect(response).to redirect_to(user_path(@user.id))
     end
   end

   def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" -is- DONE!"
    else
      flash.now[:alert] = "There was an error marking off this item."
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
    end
  end

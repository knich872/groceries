class CartMembersController < ApplicationController

  def create
    @cart_member = CartMember.new()
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    @cart_member.user = current_user
    @cart_member.shopping_cart = @shopping_cart
    if @cart_member.save
      redirect_to @shopping_cart, notice: "You were successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def cart_member_params
    params.require(:cart_member).permit(:user_id , :shopping_cart_id)
  end
end

class CartMemberController < ApplicationController

  def new
    @cart_member = CartMember.new()
  end

  def create
    @cart_member = CartMember.new(cart_member_params)
  end

  private

  def cart_member_params
    params.require(:cart_member).permit(:user_id , :shopping_cart_id)
  end
end

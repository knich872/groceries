class CartMemberController < ApplicationController

  def new
    @cart_member = CartMember.new()
  end

  def create
    @cart_member = CartMember.new(cart_member_params)
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

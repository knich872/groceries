class ShoppingCartsController < ApplicationController
  before_action :sanitize_page_params

  def index
    @shopping_carts = ShoppingCart.all
    if params[:query].present?
      @shopping_carts = @shopping_carts.search_by_keywords(params[:query])
    end
    # if params[:filter].present?
    #   @shopping_carts = @shopping_carts.where(id: current_user.shopping_cart_ids)
    # end
    # raise
  end

  def show
    @shopping_cart = ShoppingCart.find(params[:id])
    @users = User.all
    @cart_member = CartMember.new
    # @cart_member.user = current_user
    # @cart_member.shopping_cart = @shopping_cart
    # if @cart_member.save
    #   redirect_to @shopping_cart, notice: "You were successfully added!"
    # else
    #   render :new, status: :unprocessable_entity
    # end
    @cart_items = CartItem.where(shopping_cart_id: @shopping_cart)
    # raise
  end

  def new
    @shopping_cart = ShoppingCart.new()
  end

  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
    if @shopping_cart.save
      @cart_member = CartMember.create(user: current_user, shopping_cart: @shopping_cart)
      redirect_to shopping_carts_path(@shopping_cart), notice: "Shopping cart was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def shopping_cart_params
    params.require(:shopping_cart).permit(:name)
  end

  def sanitize_page_params
    params[:filter] = params[:filter].to_i
    # params[:id] = params[:id].to_i
  end

end

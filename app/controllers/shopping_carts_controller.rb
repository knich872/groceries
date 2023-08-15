class ShoppingCartsController < ApplicationController
  before_action :sanitize_page_params

  def index
    @shopping_carts = ShoppingCart.all
    if params[:query].present?
      @shopping_carts = ShoppingCart.search_by_keywords(params[:query])
    end
    if params[:filter].present?
      @shopping_carts = ShoppingCart.left_outer_joins(:cart_members).left_outer_joins(:users).where(id: params[:filter])
    end
    raise
  end

  def show
    @shopping_cart = ShoppingCart.find(params[:id])
    # @cart_members = CartMember.joins(:users, :shopping_carts).where(users.ids = cart_members.user_ids && cart_members.shopping_cart_ids = @shopping_cart)
  end

  def new
    @shopping_cart = ShoppingCart.new()
    # @cart_member = CartMember.new()
  end

  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
    if @shopping_cart.save
      @cart_member = CartMember.new(user: current_user, shopping_cart: @shopping_cart)
      # raise
      redirect_to @shopping_cart, notice: "Shopping cart was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def shopping_cart_params
    params.require(:shopping_cart).permit(:name, :shopping_list)
  end

  def sanitize_page_params
    params[:filter] = params[:filter].to_i
  end

end

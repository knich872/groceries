class ShoppingCartsController < ApplicationController
  before_action :sanitize_page_params

  def index
    @shopping_carts = ShoppingCart.all
    if params[:query].present?
      @shopping_carts = ShoppingCart.search_by_keywords(params[:query])
    end
    if params[:filter].present?
      @shopping_carts = @shopping_carts.joins(:cart_members, :users).where(id: params[:filter])
      #@shopping_carts = ShoppingCart.joins(
        #"LEFT JOIN cart_members ON cart_member.shopping_cart_id = shopping_cart.id
        #LEFT JOIN users ON user.id = cart_member.user_id").where(id: params[:filter])
      # raise
    end
  end

  def show
    @user = current_user
    # @shopping_cart = ShoppingCart.where(shopping_cart: current_user.shopping_cart.id)
  end

  def new
    @shopping_cart = ShoppingCart.new()
    # @cart_member = CartMember.new()
  end

  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
    if @shopping_cart.save
      @cart_member = CartMember.new(user: current_user, shopping_cart: @shopping_cart)
      raise
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

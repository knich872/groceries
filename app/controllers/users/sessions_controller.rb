# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    # super do |user|
    #   if user.shopping_cart.nil?
    #     # @user = user
    #     redirect_to new_shopping_cart_path(user.id)
    #   else
    #     @shopping_cart = current_user.shopping_cart
    #     redirect_to shopping_cart_path(@shopping_cart.id)
    #   end
    #   return
    # end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin?, :current_cart
  before_action :current_cart

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_cart
    @cart ||= Cart.new(session[:cart])
  end
end

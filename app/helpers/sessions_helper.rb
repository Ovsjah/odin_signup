module SessionsHelper
  def signin
    session[:user_id] = @user.id
  end

  def signout
    session.delete(:user_id)
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def current_user?
    @user == current_user
  end

  def signed_in?
    !!current_user
  end
end

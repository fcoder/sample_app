module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  ## check if we have signed in successfully
  def signed_in?
    !current_user.nil?
  end

  ## current_user=(...) is the same as self.current_user = ...
  ## So this @current_user belongs to the user, not a local variable
  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)  ## used in Listing 9.15, @user is the passdown arg
    user == current_user
  end

  # Listing10.27
  # signed_in_user used as by callback "before_filter" above
  # Before edit or update, will do signin first
  # Listing9.19  For friendly forwarding
  def signed_in_user
    unless signed_in?  ## equivalent to !signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  ## @ is a instance variable, current_user is a function to get the value of
  ## the variable
  def current_user
    ## Cookies are saved in the browser, so even if we have close the browser
    ## we can still recover it
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  ## Listing 9.18.  The following two definitions are for friendly forwarding
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end

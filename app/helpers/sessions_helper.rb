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
end

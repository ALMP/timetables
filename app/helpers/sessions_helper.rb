module SessionsHelper
  # Logs in the given user.
  def log_in(employee)
    session[:employee_code] = employee.code
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path # halts request cycle
    end
  end
  
  private
  
  def logged_in?
    session[:employee_code]
  end
end

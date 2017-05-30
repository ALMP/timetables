class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end

  def create
    employee = Employee.find_by(code: params[:session][:code].upcase)
    if employee && employee.authenticate(params[:session][:password])
      # Render employee page
      log_in employee
      redirect_to employee
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    if !session.nil?
      session.clear
      redirect_to :login
    else
      # Create an error message.
      flash.now[:danger] = 'Already logged out'
      render 'new'
    end
  end

end

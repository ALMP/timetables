class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :require_login


  helper_method :current_employee

  private

  def current_employee
    @employee ||= Employee.find_by(code: session[:employee_code]) if session[:employee_code]
  end
end

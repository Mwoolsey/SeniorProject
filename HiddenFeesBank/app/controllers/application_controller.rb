class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?


  # create an array of 500 transaction locations to choose from
  # this file is created by the seed file so that the business locations match
  # the generated businesses
  $business_transactions = File.readlines("db/transactions.txt")

  # it will take the form:
  # description locationNumber business city state
  $business_transactions.map { |t| t.split(",") }
  #-------------------------------------------------------------------------------

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up)<<:name
      devise_parameter_sanitizer.for(:account_update)<<:name
    end
end

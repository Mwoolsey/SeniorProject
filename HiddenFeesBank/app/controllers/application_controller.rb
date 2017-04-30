class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!

  # create an array of 500 transaction locations to choose from
  # this file is created by the seed file so that the business locations match
  # the generated businesses
  $business_transactions = File.readlines("db/businesses.txt")

  $carriers = ["Alltel Wireless" => "alltel", "AT&T/Cingular" => "at&t", "Boost Mobile" => "boost", "Sprint Wireless" => "sprint", "T-Mobile US" => "t-mobile", "T-Mobile UK" => "t-mobile-uk", "Virgin Mobile" => "virgin", "Verizon Wireless" => "verizon", "Vodafone Tokyo" => "vodafone-jp-tokyo"]

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :ssn])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :email])
    end
end

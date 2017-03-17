Rails.application.routes.draw do

  resources :transactions
  devise_for :users 
  resources :users, only: [:index]

  resources :users, :path => :user

  resources :accounts do
    resources :sms_alerts, shallow: true
    resources :outgoing_transfers, shallow: true
    resources :user_accounts, shallow: true
    resources :internal_transfers, shallow: true
    resources :auto_bill_payments, shallow: true
  end

  root "users#index"
end

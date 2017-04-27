Rails.application.routes.draw do

  devise_for :users 
  devise_scope :user do
    authenticated :user do
      root 'users#show'
    end
    unauthenticated do
      root "devise/sessions#new"
    end
  end
  resources :users, only: [:index]

  resources :users, :path => :user

  resources :accounts do
    resources :sms_alerts, shallow: true
    resources :outgoing_transfers, shallow: true
    resources :user_accounts, shallow: true
    resources :internal_transfers, shallow: true
    resources :auto_bill_payments, shallow: true
    resources :transactions, shallow: true
  end

  get 'transfers' => "transfers#new"
  get 'accounts/:id/updated_at' => "accounts#updated_at"

end

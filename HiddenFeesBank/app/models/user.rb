class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :ssn, presence: true
  validates :accountNumber, presence: true
  has_many :accounts
  has_many :user_accounts
  include ActionView::Helpers
end

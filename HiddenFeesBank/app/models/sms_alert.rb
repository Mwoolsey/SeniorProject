class SmsAlert < ApplicationRecord
  belongs_to :account

  def self.validate_phone(number)
    if number.length != 10
      return nil
    else
      return number.to_i
    end
  end
end

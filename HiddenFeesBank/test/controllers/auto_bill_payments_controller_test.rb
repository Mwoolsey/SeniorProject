require 'test_helper'

class AutoBillPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auto_bill_payment = auto_bill_payments(:one)
  end

  test "should get index" do
    get auto_bill_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_auto_bill_payment_url
    assert_response :success
  end

  test "should create auto_bill_payment" do
    assert_difference('AutoBillPayment.count') do
      post auto_bill_payments_url, params: { auto_bill_payment: { account_id: @auto_bill_payment.account_id, amount: @auto_bill_payment.amount, businessAddress: @auto_bill_payment.businessAddress, businessName: @auto_bill_payment.businessName, dateToPay: @auto_bill_payment.dateToPay, destinationAcctNumber: @auto_bill_payment.destinationAcctNumber, originAcctNumber: @auto_bill_payment.originAcctNumber } }
    end

    assert_redirected_to auto_bill_payment_url(AutoBillPayment.last)
  end

  test "should show auto_bill_payment" do
    get auto_bill_payment_url(@auto_bill_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_auto_bill_payment_url(@auto_bill_payment)
    assert_response :success
  end

  test "should update auto_bill_payment" do
    patch auto_bill_payment_url(@auto_bill_payment), params: { auto_bill_payment: { account_id: @auto_bill_payment.account_id, amount: @auto_bill_payment.amount, businessAddress: @auto_bill_payment.businessAddress, businessName: @auto_bill_payment.businessName, dateToPay: @auto_bill_payment.dateToPay, destinationAcctNumber: @auto_bill_payment.destinationAcctNumber, originAcctNumber: @auto_bill_payment.originAcctNumber } }
    assert_redirected_to auto_bill_payment_url(@auto_bill_payment)
  end

  test "should destroy auto_bill_payment" do
    assert_difference('AutoBillPayment.count', -1) do
      delete auto_bill_payment_url(@auto_bill_payment)
    end

    assert_redirected_to auto_bill_payments_url
  end
end

require 'test_helper'

class InternalTransfersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @internal_transfer = internal_transfers(:one)
  end

  test "should get index" do
    get internal_transfers_url
    assert_response :success
  end

  test "should get new" do
    get new_internal_transfer_url
    assert_response :success
  end

  test "should create internal_transfer" do
    assert_difference('InternalTransfer.count') do
      post internal_transfers_url, params: { internal_transfer: { account_id: @internal_transfer.account_id, amount: @internal_transfer.amount, destinationAcctNumber: @internal_transfer.destinationAcctNumber, originAcctNumber: @internal_transfer.originAcctNumber } }
    end

    assert_redirected_to internal_transfer_url(InternalTransfer.last)
  end

  test "should show internal_transfer" do
    get internal_transfer_url(@internal_transfer)
    assert_response :success
  end

  test "should get edit" do
    get edit_internal_transfer_url(@internal_transfer)
    assert_response :success
  end

  test "should update internal_transfer" do
    patch internal_transfer_url(@internal_transfer), params: { internal_transfer: { account_id: @internal_transfer.account_id, amount: @internal_transfer.amount, destinationAcctNumber: @internal_transfer.destinationAcctNumber, originAcctNumber: @internal_transfer.originAcctNumber } }
    assert_redirected_to internal_transfer_url(@internal_transfer)
  end

  test "should destroy internal_transfer" do
    assert_difference('InternalTransfer.count', -1) do
      delete internal_transfer_url(@internal_transfer)
    end

    assert_redirected_to internal_transfers_url
  end
end

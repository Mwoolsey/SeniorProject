require 'test_helper'

class OutgoingTransfersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outgoing_transfer = outgoing_transfers(:one)
  end

  test "should get index" do
    get outgoing_transfers_url
    assert_response :success
  end

  test "should get new" do
    get new_outgoing_transfer_url
    assert_response :success
  end

  test "should create outgoing_transfer" do
    assert_difference('OutgoingTransfer.count') do
      post outgoing_transfers_url, params: { outgoing_transfer: { account_id: @outgoing_transfer.account_id, amount: @outgoing_transfer.amount, destinationAcctNumber: @outgoing_transfer.destinationAcctNumber, originAcctNumber: @outgoing_transfer.originAcctNumber, routingNumber: @outgoing_transfer.routingNumber } }
    end

    assert_redirected_to outgoing_transfer_url(OutgoingTransfer.last)
  end

  test "should show outgoing_transfer" do
    get outgoing_transfer_url(@outgoing_transfer)
    assert_response :success
  end

  test "should get edit" do
    get edit_outgoing_transfer_url(@outgoing_transfer)
    assert_response :success
  end

  test "should update outgoing_transfer" do
    patch outgoing_transfer_url(@outgoing_transfer), params: { outgoing_transfer: { account_id: @outgoing_transfer.account_id, amount: @outgoing_transfer.amount, destinationAcctNumber: @outgoing_transfer.destinationAcctNumber, originAcctNumber: @outgoing_transfer.originAcctNumber, routingNumber: @outgoing_transfer.routingNumber } }
    assert_redirected_to outgoing_transfer_url(@outgoing_transfer)
  end

  test "should destroy outgoing_transfer" do
    assert_difference('OutgoingTransfer.count', -1) do
      delete outgoing_transfer_url(@outgoing_transfer)
    end

    assert_redirected_to outgoing_transfers_url
  end
end

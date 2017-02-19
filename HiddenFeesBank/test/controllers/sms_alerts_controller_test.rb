require 'test_helper'

class SmsAlertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sms_alert = sms_alerts(:one)
  end

  test "should get index" do
    get sms_alerts_url
    assert_response :success
  end

  test "should get new" do
    get new_sms_alert_url
    assert_response :success
  end

  test "should create sms_alert" do
    assert_difference('SmsAlert.count') do
      post sms_alerts_url, params: { sms_alert: { account_id: @sms_alert.account_id, alertType: @sms_alert.alertType, frequency: @sms_alert.frequency } }
    end

    assert_redirected_to sms_alert_url(SmsAlert.last)
  end

  test "should show sms_alert" do
    get sms_alert_url(@sms_alert)
    assert_response :success
  end

  test "should get edit" do
    get edit_sms_alert_url(@sms_alert)
    assert_response :success
  end

  test "should update sms_alert" do
    patch sms_alert_url(@sms_alert), params: { sms_alert: { account_id: @sms_alert.account_id, alertType: @sms_alert.alertType, frequency: @sms_alert.frequency } }
    assert_redirected_to sms_alert_url(@sms_alert)
  end

  test "should destroy sms_alert" do
    assert_difference('SmsAlert.count', -1) do
      delete sms_alert_url(@sms_alert)
    end

    assert_redirected_to sms_alerts_url
  end
end

$(document).ready(function() {
  setInterval(function(){ tableUpdated(); }, 5000);
}

function tableUpdated() {
  var $target = $('.table-custom');
  var id = $target.attr('data-record-id');
  $ajax(
      url : '/accounts/'+id+'/updated_at',
      dataType : 'json',
      type : 'GET',
      success: function(data) {
	$target.html(data['response']);
      }
  );
}

$(document).on('ajax:success', '.like-button', function(e) {
  var likesCount = $(this).parent().find('.likes-count');
  likesCount.text(parseInt(likesCount.text()) + 1);
});
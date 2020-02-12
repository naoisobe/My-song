window.onload = function () {
  $('#back').fadeIn();
  document.getElementById('next').onclick = function () {
    $('#back').fadeOut();
  }
};
$('#next').on('click', function () {
  $('.show-back').show();
});

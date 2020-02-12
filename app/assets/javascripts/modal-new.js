window.onload = function () {
  $('.back').fadeIn();
  document.getElementById('next').onclick = function () {
    $('.back').fadeOut();
  }
};
$('#next').on('click', function () {
  $('.show-back').show();
  $('.back').addClass('new-back');
  $('div').removeClass('back');
  $('.modal-box').removeAttr('id');
  $('.new-song-btn').remove();
  $('.new-back').css({
    background: 'whitesmoke',
    marginBottom: '10px',
  });
});

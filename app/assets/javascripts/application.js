// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require_tree .
//= require activestorage
//= require popper
//= require bootstrap-sprockets
//= require audiojs
//= require dropzone

// < !--audiojsの初期化 -->
audiojs.events.ready(function () {
  var as = audiojs.createAll();
});

document.addEventListener(
  "DOMContentLoaded", e => {
    let modal_open = document.getElementById("modal-open-btn");
    modal_open.onclick = function () {
      $('#overlay').fadeIn();
      document.getElementById('modal-close-btn').onclick = function () {
        $('#overlay').fadeOut();
      };
      document.getElementById("delete-comformation-btn").onclick = function () {
        document.getElementById("song-delete-btn").click();
      };
    };
  },
  false
);

// プロフィール画像プレビュー
$(function () {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#profile_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#file_upload").change(function () {
    readURL(this);
  });
});


//flashメッセージの表示時間
$(function () {
  setTimeout("$('.notice').fadeOut('slow')", 3000)
})

// ドロップゾーン
$(function () {
  // disable auto discover
  Dropzone.autoDiscover = false;
  autoProcessQueue = false;

  $(".dropzone").dropzone({
    maxFilesize: 1,
    addRemoveLinks: true
  });
});

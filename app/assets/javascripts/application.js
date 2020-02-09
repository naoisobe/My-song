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
//= require jquery.jscroll.min.js

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


$(function () {
  // disable auto discover
  Dropzone.autoDiscover = false;
  autoProcessQueue = false;

  $(".dropzone").dropzone({
    maxFilesize: 1,
    addRemoveLinks: true
  });
});

new Vue({
  el: '#app',
  data: {
    status: 'init',     // 状況
    recorder: null,     // 音声にアクセスする "MediaRecorder" のインスタンス
    audioData: [],      // 入力された音声データ
    audioExtension: ''  // 音声ファイルの拡張子
  },
  methods: {
    startRecording() {

      this.status = 'recording';
      this.audioData = [];
      this.recorder.start();

    },
    stopRecording() {

      this.recorder.stop();
      this.status = 'ready';

    },

    getExtension(audioType) {

      let extension = 'wav';
      const matches = audioType.match(/audio\/([^;]+)/);

      if (matches) {

        extension = matches[1];

      }

      return '.' + extension;

    }

  },
  mounted() {

    navigator.mediaDevices.getUserMedia({ audio: true })
      .then(stream => {

        this.recorder = new MediaRecorder(stream);
        this.recorder.addEventListener('dataavailable', e => {

          this.audioData.push(e.data);
          this.audioExtension = this.getExtension(e.data.type);

        });
        this.recorder.addEventListener('stop', () => {

          const audioBlob = new Blob(this.audioData);
          const url = URL.createObjectURL(audioBlob);
          let a = document.createElement('a');
          a.href = url;
          a.download = Math.floor(Date.now() / 1000) + this.audioExtension;
          document.body.appendChild(a);
          a.click();

        });
        this.status = 'ready';

      });

  }
});




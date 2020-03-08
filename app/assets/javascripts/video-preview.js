$(function () {
  $fileField = $('.upload-video')
  $fileField.on('change', function (e) {
    file = e.target.files[0]
    reader = new FileReader(),
      $preview = $(".movie-group");

    reader.onload = (function (file) {

      return function (e) {
        $preview.empty();
        $preview.append($('<video>').attr({
          src: e.target.result,
          width: "100%",
          height: "400px",
          playsinline: "true",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

// ドロップゾーン
// 後続処理がうまくいかないため、二箇所で同じコードの使用
$(function () {
  // disable auto discover
  Dropzone.autoDiscover = false;
  autoProcessQueue = false;

  $(".dropzone").dropzone({
    maxFilesize: 1,
    addRemoveLinks: true
  });
});



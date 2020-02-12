$(function () {
  $fileField = $('.upload-audio')
  $fileField.on('change', function (e) {
    file = e.target.files[0]
    reader = new FileReader(),
      $preview = $(".audio-group");
    reader.onload = (function (file) {

      return function (e) {
        $preview.empty();
        $preview.append($('<audio>').attr({
          src: e.target.result,
          width: "100%",
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



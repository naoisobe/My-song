// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
if (/rooms/.test(window.location.pathname)) {
  var path = window.location.pathname.split('/');
  var room_id = path[path.length - 1];
  App.chat_room = App.cable.subscriptions.create({ channel: "DirectMessagesChannel", room_id: room_id }, {
    connected: function () { },
    disconnected: function () { },
    received: function (data) {
      $('.messages').append(data['content']);
    },
    speak: function (message) {
      return this.perform('speak', {
        message: message,
        room_id: room_id,
        user_id: $('meta[name="current_user_id"]').attr('content')
      });
    }
  });
  $(document).on('keypress', '[data-behavior~=room_speaker]', function (event) {
    if (event.keyCode === 13) {
      App.chat_room.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
}

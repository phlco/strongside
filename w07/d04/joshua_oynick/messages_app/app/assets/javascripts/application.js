// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){

  var $my_message_list = $('#my-message-list');

  setTimeout(function(){


    $.ajax({
      method: 'GET',
      url: '/',
      dataType: 'json'
    })
    .done(function(data){
      console.log(data)
      $.each(data, function(index, message){
        $my_message_list.append('<li>' + message['sender'] + '~' + message['note'] + '</li>')
      })
    })

  }, 2000)

  var $user_form = $('#user-form');

  $user_form.on('submit', function(e){

    e.preventDefault();

    var $user_sender_val = $('#user-sender-input').val()
    var $user_note_val = $('#user-note-input').val()

    $.ajax({
      method: 'POST',
      url: '/messages',
      dataType: 'json',
      data: {message: {sender: $user_sender_val, note: $user_note_val}}
    })
    .done(function(data){
      console.log(data)
        $my_message_list.append('<li>' + data['sender'] + '~' + data['note'] + '</li>');
    })
  })
});



// <form id='user-form'>
//   <input type='text' id='user-sender-input' placeholder='sender'/>
//   <input type='text' id='user-note-input' placeholder='note' />
//   <input type='submit' />
// </form>


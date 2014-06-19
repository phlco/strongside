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

$(document).ready(function(){

  $('#new_lamb').on('submit', newLamb);
  $('#lambs').on('click', '.lamb', updateLamb);

});

function newLamb(e){
  e.preventDefault();
  $.ajax({
    url: "/lambs",
    type: "POST"
  }).done(renderLamb);
}

function renderLamb(data){
  // debugger;
  $('<li>')
    .text('lamb')
    .addClass('lamb')
    .data({id: data.id})
    .appendTo('#lambs');
}

function updateLamb(e) {
  var $lamb = $(this);
  $.ajax({
    type: "PUT",
    url: "/lambs/" + $(this).data().id
  }).done(function(response){
    $lamb.text('baaa');
  });
}

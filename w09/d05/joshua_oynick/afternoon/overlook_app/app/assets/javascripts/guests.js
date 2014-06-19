$(function(){
  $('#register-form').on('submit', function(e){
    e.preventDefault();
    debugger;
    createGuest().done(function(response) {
      $('#notice').html("Welcome, " + response.name);
    });
  });
});

function createGuest(){
  var nameVal = $('#registered_guest').val();
  return $.ajax({
    url: '/guests',
    type: 'post',
    dataType: 'json',
    data: { guest: { name: nameVal } }
  });
}

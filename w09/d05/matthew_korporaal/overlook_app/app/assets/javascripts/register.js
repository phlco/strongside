$(document).ready(function () {

  $('#register').on("click", function (e) {
    e.preventDefault();
    debugger;
    $.ajax({
      url : '/users.json',
      type: 'POST'

    });
  });
});
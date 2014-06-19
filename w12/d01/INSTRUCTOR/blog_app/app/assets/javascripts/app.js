$(document).ready(function(){

  // $(document).on("ajax:before", function(){
  //   $("#repos").html('<img src="assets/ajax-loader.gif" alt="loading...">')
  // });

  // $(document).on("ajax:success", function(event, data){
  //   console.log(event, data);
  //   setTimeout(function(){
  //     $('#repos').html(data['Title']);
  //   }, 1000);
  // });

  $('#github').on("click", function(){
    $.ajax({
      url: "http://www.omdbapi.com/?t=True%20Grit&y=1969",
      dataType: "json",
      type: "get",
      beforeSend: function(){
        $("#repos").html('<img src="assets/ajax-loader.gif" alt="loading...">')
      },
      success: function(data){
        setTimeout(function(){
          $('#repos').html(data['Title']);
        }, 1000);
      }
    });
  });
});

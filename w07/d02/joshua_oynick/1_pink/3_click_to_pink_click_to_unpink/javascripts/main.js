$( document ).ready(function() {

  $('h1').on("click", function() {

    var isPink = $("body").hasClass("pink")
    if (isPink) {
      $("body").removeClass("pink");
    }
    else {
      $("body").addClass("pink");
    }
  });
});

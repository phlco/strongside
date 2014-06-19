function recieveData(dataReceived) {
  $.each(dataReceived, function(i, cat){
    var catContainer = $("<div>");
    var catz = $("<h3>").attr("class", "kittay").html(cat.name);
    var image = $("<img>").attr("src", cat.image_url);
    var button = $('<button>').html("delete");
    button.on("click", function(){
      debugger
      $.ajax({
        type: "DELETE",
        url: "/cats/" + cat.id
      }).done(function() {
        console.log("got rid of z cat");
      });
    })
    $("body").append(catz);
    $("body").append(image);
    $("body").append(button);

  });
}
$(document).ready(function(){
$("#cat-maker").on("click", function() {
  console.log('this works')
});

$.ajax({
  type: "GET",
  url: '/cats.json',
}).done(recieveData);

})










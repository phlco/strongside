// function deleteCat(cat){
//   $.ajax({
//     type: "DELETE",
//     url: "/kitties"+id,
//     dataType: "json",
//   }).done
// }

console.log("js works")

$( document ).ready(function() {

  // jQuery's AJAX function
  $.ajax({
    type: "GET",
    url: "/kitties",
    dataType: "json",
    //this an example hash
  }).done(function(data) {    // the parameter 'data' is the response AJAX gets.
    body = $("#body")

    $(data).each(function(i, kitty){
      name = kitty.name;
      tagline = kitty.tagline;
      imgURL = kitty.img_url;
      id = kitty.id;
      var kittyDiv = $('<div>');
      kittyDiv.addClass('kitty');
      kittyDiv.attr('data-id', id);

      kittyDiv.append("<p>Name: " + name + "</p>");
      kittyDiv.append("<p>Tagline: " + tagline + "</p>");
      kittyDiv.append("<p>Image URL : " + imgURL + "</p>");
      kittyDiv.append("<p>ID : " + id + "</p>");

      kittyDiv.append("<button>Delete</button>");

      $('body').append(kittyDiv);

      kittyDiv.on("click", function(){
        debugger;
        $.ajax({
          type: "DELETE",
          url: "/kitties/" + $(this).attr('data-id'),
          dataType: "json"
        });
        $(this).hide();

      }) // on

    }); // each

  }) // done

  $('#create-kitty').on("click", function() {
    kittyName = $("#kitty_name").val();
    kittyTag = $("#kitty_tagline").val();
    kittyImg = $("#kitty_img_url").val();

    // posts a new kitty to the database and
    $.ajax({
      type: "post",
      url: "/kitties",
      dataType: "json",
    data: { kitty: { name: kittyName, tagline: kittyTag, img_url: kittyImg } } //this an example hash
  }).done(function(msg) {         // 'msg' is just for this example. by default, the parameter is the response AJAX gets.
  body.append("<p>Name: " + kittyName + "</p>")
  body.append("<p>Tagline: " + kittyTag + "</p>")
  body.append("<p>Image URL : " + kittyImg + "</p>")
  console.log(msg);
})




});




});

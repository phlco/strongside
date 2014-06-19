var CatBook = CatBook || {}

// NEW: I want to fetch all the cats from my database

$(document).ready(function() {
  CatBook.listCats();
  $("#cat-form").on("submit", CatBook.createCat);
});

CatBook.listCats = function() {
  $.ajax({
    type: "GET",
    url: "/cats.json",
  }).done(function(cats) {

    $ul = $("#cat-index").
      html("");

    $.each(cats, function(i, cat){
      var $li = $("<li>")
        .appendTo($ul)

      var $name = $("<h3>")
        .text(cat["name"] + " [" + cat["age"] + "]")
        .appendTo($li);


      var $tagLine = $("<p>")
        .text(cat["tag_line"])
        .appendTo($li);

      var $imageUrl = $("<img>")
        .attr("src", cat["image_url"])
        .appendTo($li);

      var $deleteButton = $("<button>")
        .text("Delete Kitty")
        .appendTo($li);

      $deleteButton.on("click", function(e) {

        var deleteUrl = "/cats/"+cat.id+".json";

        $.ajax({
          type: "DELETE",
          url: deleteUrl
        }).done(function(response) {
          $li.remove();
        })

      });

    })
  })
}

CatBook.createCat = function() {
  // TODO
}




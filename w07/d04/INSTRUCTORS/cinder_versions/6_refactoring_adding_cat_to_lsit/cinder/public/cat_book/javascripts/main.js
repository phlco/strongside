var CatBook = CatBook || {}

$(document).ready(function() {
  CatBook.listCats();
  $("#cat-form").on("submit", CatBook.createCat);
});


CatBook.View = {
  addCatToList: function(cat) {
    var $ul = $("#cat-index");

    var $li = $("<li>")
      .appendTo($ul);

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

  }

};

CatBook.listCats = function() {
  $.ajax({
    type: "GET",
    url: "/cats.json",
  }).done(function(cats) {
    console.log(cats)
    $ul = $("#cat-index").html("");

    $.each(cats, function(i, cat){
      CatBook.View.addCatToList(cat);
    });
  })
}

CatBook.createCat = function(e) {
  e.preventDefault();

  var catParams = {};
  $.each($(this).serializeArray(), function(i, field) {
    catParams[field.name] = field.value;
  });

  $.ajax({
    type: "POST",
    url: "/cats.json",
    data: { cat: catParams }
  }).done(function(newCat){
    CatBook.listCats();
  });

}




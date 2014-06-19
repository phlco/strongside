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
      .attr("cat-id", cat["id"])
      .text("Delete Kitty")
      .appendTo($li);

    var $deleteButton.on("click", function(e){
      var kitty = cat;

      e.preventDefault();

      var catId = $(this).attr("cat-id");
      var deleteUrl = "/cats/"+catId+".json"; // Don't forget to debugger

      $.ajax({
        type: "delete",
        url: deleteUrl
      }).done(function (deletedCat){
        debugger
        CatBook.listCats();
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
    CatBook.View.addCatToList(newCat);
  });

}



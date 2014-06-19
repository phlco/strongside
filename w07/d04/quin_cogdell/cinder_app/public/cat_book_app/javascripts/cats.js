var CatBookApp = CatBookApp || {};


CatBookApp.loadCats = function() {
  var type = "GET",
      url = "http://localhost:3000/cats.json";

  $.ajax({
      type: type,
      url: url
    }).done(CatBookApp.addCats);
};


CatBookApp.addCats = function(data) {
  var $catsEl = $("#cats"),
      $catsUl = $("<ul />"),
      name = "",
      age = "";

  $.each(data, function() {
    var $catsLi;
    name = this.name;
    age = this.age;
    $catsLi = $("<li />");
    $catsLi.text(this.name);
    $catsUl.append($catsLi);
  });
  $catsEl.append($catsUl);
};


CatBookApp.newCat = function(e) {
  e.preventDefault();
  var newCat = {
        name: $("input[name=name]").val(),
        age: $("input[name=age]").val(),

        image_url: $("input[name=image_url]").val()
      },
      type = "POST",
      url = "http://localhost:3000/cats";

  $.ajax({
    type: type,
    url: url,
    data: JSON.stringify({cat: newCat})
  }).done(function() {
    alert("Cat Created!")
  })

}

CatBookApp.setEventListeners = function() {
  $("#create_cat").on("click", CatBookApp.newCat);
}

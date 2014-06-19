var catBookApp = catBookApp || {};

$(document).ready(function() {
  getCats();
  $(".add-cat").on("click", addCat);
  $(".submit-cat").on("click", postCat);
  $(".delete-cat").on("click", deleteCat);
});

function getCats() {
  $.ajax({
    type: "GET",
    url: "http://localhost:3000/cats.json"
  }).done(function(data) {
    var ulTag = $("<ul>");
    for (var i = 0; i < data.length; i++) {
      var liTag = $("<li>");
      var button = $("<input type='submit' />");
      var cat = data[i];
      var info = cat.name + " is " + cat.age + " (" + cat.tag_line + ")"
      liTag.text(info);
      liTag.append(button)
      ulTag.append(liTag);

    }
    $(".cat").append(ulTag);
  });
}

function addCat() {
  $(".create-cat").removeClass("hidden-form");
}

function postCat() {
  var name = $("form").find("input[name='name']").val();
  var age = $("form").find("input[name='age']").val();
  var tagLine = $("form").find("input[name='tag_line']").val();
  var photo = $("form").find("input[name='image_url']").val();

  var newCatParams = {
    cat: {
      name: name,
      age: age,
      tag_line: tagLine,
      image_url: photo
    }
  }
  $.ajax({
    type: "POST",
    url: "http://localhost:3000/cats.json",
    data: newCatParams
  }).done(alert("sent!"));
}

function deleteCat() {

}


var Cats = Cats || {};

$(document).ready(function(){

  Cats.allAnimals = $("#animals");

  Cats.loadCats();

  Cats.addCatForm = $("#add-cat");

  Cats.addCatForm.on("submit", function(e){
    e.preventDefault();
    Cats.addCat();
  });

});



Cats.loadCats = function() {
  $.ajax({
    type: "GET",
    url: "../cats.json",
  }).done(function(data){
    $.each(data, function(i, cat){
      Cats.appendAnimal(cat);
    });
  })
}

Cats.addCat = function() {
  var $form = $("#add-cat");
  var catName = $form.children("[name='name']").val();
  var catAge = $form.children("[name='age']").val();
  var catTagLine = $form.children("[name='tag_line']").val();
  var catImageUrl = $form.children("[name='image_url']").val();

  var newCat = {
    cat: {
      name: catName,
      age: catAge,
      tag_line: catTagLine,
      image_url: catImageUrl
    }
  }

  $.ajax({
    type: "POST",
    url: "../cats.json",
    data: newCat
  }).done(function(data){
    Cats.loadCats();
  });
  $form[0].reset();
}

Cats.appendAnimal = function(cat) {
  var animal = $("<ul>");
      animal.append("<li>" + cat.name + "</li>");
      animal.append("<li>" + cat.age + "</li>");
      animal.append("<li>" + cat.tag_line + "</li>");
      animal.append("<li><img src='" + cat.image_url + "'></li>");
      animal.append("<button class='delete'>delete</button>");
      $(".delete").on.call(animal, "click", Cats.deleteCat);
      animal.data("id", cat.id);
      Cats.allAnimals.append(animal);
}

Cats.deleteCat = function(cat) {
  var $catId = $(this).data("id")
  $.ajax({
    type: "DELETE",
    url: "../cats/" + $catId,
    data: $catId,
    dataType: "json",
    success: function(data){
      $catId.remove();
    },
    // error function takes 3 parameters: object, error status, error code
    error: function(p1, p2, p3) {
      console.log("Error: " + p1 + "---" + p2 + "---" + p3);
    }
  });
}







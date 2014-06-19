$(function(){
  // show all cats
  var url = "../cats.json";
  $.ajax({
    type: "GET",
    url: url
  }).done(function(data){
    var cats = data;
    $.each(cats, function(i, cat){
      makeCatDiv(cat);
    });
  });
  // create new Cat
  var $form = $('form');
  $form.on('submit', createCats);
});

function createCats(e) {
  e.preventDefault();
  var url = "../cats.json";
  var $name = $('input[name="name"]').val();
  var $age = $('input[name="age"]').val();
  var $img = $('input[name="image_url').val();
  $.ajax({
    type: "POST",
    url: url,
    data: { cat: {
      name: $name,
      age: $age,
      image_url: $img
    }}
  }).done(makeCatDiv);
  clearForm();
}

function makeCatDiv(cat){
  var $div = $('<div>').addClass('cat');
  $('body').append($div);
  var $name = $('<p>').text(cat.name);
  var $age = $('<p>').text(cat.age);
  if(cat.image_url && cat.image_url !== null){
    var $img = $('<img>').attr("src", cat.image_url);
    $div.append($img);
  }
  $div.append($name);
  $div.append($age);
}

function clearForm(){
    $name = $('input[name="name"]').val("");
    $age = $('input[name="age"]').val("");
    $img = $('input[name="image_url').val("");
}

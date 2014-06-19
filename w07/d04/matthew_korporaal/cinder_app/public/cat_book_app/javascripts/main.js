var CatBook = CatBook || {};

CatBook.main = function() {
  // Get info to display all - request to cats
  // when ready call function to display cats
  CatBook.requestCats();
  // on submission of form preventDefault action(going to route)
  $('#add-cat-form').on('submit', function(e){
    e.preventDefault();
    CatBook.addCat();
  });

}

$('document').ready(CatBook.main);

CatBook.requestCats = function() {
  $.ajax({
    type: "GET",
    url: "/cats.json"
  }).done(CatBook.displayCats);
}

CatBook.displayCats = function(data) {

  $.each(data, function(i, cat){
    var $catDivTag = $('<div>', {id: "cat-div"});
    var $ulTag = $('<ul>', {id: "show-all-cats"});

    var $liTag = $('<li>').text("Name: " + cat.name);
    $ulTag.append($liTag);

    // $liTag = $('<li>').text("Age: " + cat.age);
    // $ulTag.append($liTag);

    // $liTag = $('<li>').text("Image: " + cat.image_url);
    // $ulTag.append($liTag);

    // $liTag = $('<li>').text("Tag: " + cat.tagline);
    // $ulTag.append($liTag);

    var $deleteButton = $('<button>').html('delete');
    $deleteButton.on('click', function(e){
      e.preventDefault();
      CatBook.deleteCat(cat);
    });

    $('#show-all')
      .append($catDivTag)
      .append($ulTag)
      .append($deleteButton);
  });
}

CatBook.addCat = function(e){
  var name = $('#add-cat-form')
    .find("input[name='name']").val()
  var age = $('#add-cat-form')
    .find("input[name='age']").val()
  var image = $('#add-cat-form')
    .find("input[name='image']").val()
  var tag = $('#add-cat-form')
    .find("input[name='tag']").val()

  var data = {
    cat: {
      name: name,
      age: age,
      image_url: image,
      tagline: tag
    }
  };
  $.ajax({
    type: "POST",
    url: '/cats.json',
    data: data
  }).done(
    function(){
      CatBook.requestCats();
    }
  );
}

CatBook.deleteCat = function(cat){
  $.ajax({
    type: "DELETE",
    url: '/cats/' + cat.id + '.json',
    data: cat.id
  }).done(
    function(){
      $('#show-all').empty();
      CatBook.requestCats();
    }
  );
}
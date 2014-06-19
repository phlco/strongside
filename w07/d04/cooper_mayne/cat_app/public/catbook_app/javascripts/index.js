$(document).ready(function(){
  console.log('hi')
  displayCats();
  bindForm();
})

function bindForm () {
  $('form').on('submit',function(e) {
    var $form = $(this).serialize();
    $.ajax({
      type: 'POST',
      url: '/cats.json',
      data: $form,
      success: function(data, textStatus, jqXHR) {
        displayCat(data);
      },
      error: function(xhr, status, error) {
        alert ("database does't like you");
      }
    }).done(function(data) {
      alert('posted');
    })
    e.preventDefault();
  })
}

function displayCats () {
  $.ajax({
      type: 'GET',
      url: '/cats.json',
      }).done(function(data) {
        $.each(data, function(index, cat) {
          displayCat(cat);
        })
      })
}

function displayCat (cat) {
  var catty = $('<div></div>')
  var catImage = $('<img></img>');
  var catDelete = $('<button>delete</button>');
  var catName = $('<span></span>');
  catName.text(cat.name)
  catDelete.attr('data-id', cat.id)
  catImage.attr('data-score', cat.score)
  catImage.attr('src', cat.img_url)
  catImage.attr('height', '100px')
  catty.append(catImage);
  catty.append(catDelete);
  catty.append(catName);

  catDelete.on('click', function() {
    var catID = $(this).attr('data-id')
    $(this).parent().remove();
    $.ajax({
      type: 'DELETE',
      url: '/cats/'+catID+'.json',
    })
  })

  $('#list-cats').append(catty);
}

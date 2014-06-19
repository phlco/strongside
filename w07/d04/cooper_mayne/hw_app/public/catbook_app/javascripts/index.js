$(document).ready(function(){
  console.log('hi')
  //displayStudents();
  //bindForm();

    var $form = {student:{name:'coopy', email: 'c@c.c', img_url: 'asfd.jpg'}}
    $.ajax({
      type: 'POST',
      url: '/students.json',
      data: $form,
    }).done(function(data) {
      alert('posted');
    })
})

function displayStudents () {
  $.ajax({
      type: 'GET',
      url: '/students.json',
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
      url: '/students/'+catID+'.json',
    })
  })

  $('#list-students').append(catty);
}

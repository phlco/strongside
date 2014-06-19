var KickHash = KickHash || {};

KickHash.main = function(){
  KickHash.displayStudents();

  $('#add-student-form').on('submit', function(e){
    e.preventDefault();
    KickHash.addStudent();
  });
}

$('document').ready(KickHash.main);

KickHash.displayStudents = function(){
  //ajax request
  // $.ajax({
  //   type: "GET",
  // })
$.ajax({
  method: 'GET',
  dataType: 'json',
  url: "/students.json"

})
.done( function(xhr) {
  KickHash.renderHTML(xhr);
});

}
KickHash.renderHTML = function(xhr) {
  var $studentTBTag = $('#show-all');

  $.each(xhr, function(i, student){
    var $trTag = $('<tr>', {id: "show-all-student"});

    var $thTag = $('<th>').text(student.name);
    $thTag.attr("class", student.id);
    $trTag.append($thTag);

    var $thTag = $('<th>').text(student.img_url);
    $thTag.attr("class", student.id);

    $trTag.append($thTag);

    var $thTag = $('<th>').text(student.email);
    $thTag.attr("class", student.id);

    $trTag.append($thTag);

    var $updateButton = $('<button>').html('update');
    $updateButton.on('click', function(e){
     e.preventDefault();
     KickHash.updateStudent(student);
   });
    var $thTag = $('<th>').append($updateButton);
    $thTag.attr("class", student.id);
    $trTag.append($thTag);

    var $deleteButton = $('<button>').html('delete');
    $deleteButton.on('click', function(e){
      e.preventDefault();
      KickHash.deleteStudent(student);
    });

    var $thTag = $('<th>').append($deleteButton);
    $trTag.append($thTag);

    $('#show-all')
    .append($studentTBTag)
    .append($trTag);
  });
}
// KickHash.renderHTML = function(xhr) {
//   $.each(xhr, function(i, student){
//     var $studentDivTag = $('<div>', {id: "student-div"});
//     var $ulTag = $('<ul>', {id: "show-all-student"});

//     var $liTag = $('<li>').text("Name: " + student.name);
//     $ulTag.append($liTag);

//      $liTag = $('<li>').text("Image: " + student.img_url);
//      $ulTag.append($liTag);

//      $liTag = $('<li>').text("Tag: " + student.email);
//      $ulTag.append($liTag);

//     var $updateButton = $('<button>').html('update');
//       $updateButton.on('click', function(e){
//       e.preventDefault();
//       KickHash.updateStudent(student);
//     });

//     var $deleteButton = $('<button>').html('delete');
//       $deleteButton.on('click', function(e){
//       e.preventDefault();
//       KickHash.deleteStudent(student);
//     });

//     $('#show-all')
//     .append($studentDivTag)
//     .append($ulTag)
//     .append($updateButton)
//     .append($deleteButton);
//   });
// }
KickHash.addStudent = function(e){

  var name = $('#add-student-form')
  .find("input[name='name']").val()
  var age = $('#add-student-form')
  .find("input[name='age']").val()
  var image = $('#add-student-form')
  .find("input[name='image']").val()

  var data = {
    student: {
      name: name,
      age: age,
      img_url: image
    }
  };
  $.ajax({
    type: "POST",
    url: '/students.json',
    data: data
  }).done(
  function(){
    KickHash.displayStudents();
  });
}

KickHash.updateStudent = function(student){
  var $name = $('.' + student.id.toString()).slice(0,1);
  var $img_url = $('.' + student.id.toString()).slice(1,2);
  var $email = $('.' + student.id.toString()).slice(2,3);
  var $update = $('.' + student.id.toString()).slice(3,4).children();

  $newName = $('<input>', {id: "new-name", value: $name.text()});
  $newImg = $('<input>', {id: "new-img", value: $img_url.text(), style: "width:500px;"});
  $newEmail = $('<input>', {id: "new-email", value: $email.text(), style: "width:200px;"});

  $name.text("");
  $name.append($newName);
  $img_url.text("");
  $img_url.append($newImg);
  $email.text("");
  $email.append($newEmail);

  $update.off("click",  function(e){
   e.preventDefault();
   KickHash.updateStudent(student);
 });


  $update.on("click", function(e){
    e.preventDefault();
          debugger;
    $.ajax({
      method: 'PUT',
      url: '/students/' + student.id + '.json',
      data: {
        id: student.id,
        student: {
          name: $name.value(),
          email: $email.value(),
          img_url: $img_url.value()
        }
      }
    }).done(

    function(e){
      $('#show-all').empty();
      KickHash.displayStudents();
    });
  });
  // var name = $('#new-name')
  // .find("input[name='name']").val($name)
  // var age = $('#new-img')
  // .find("input[name='age']").val($img_url)
  // var image = $('#add-student-form')
  // .find("input[name='image']").val($email)


}

KickHash.deleteStudent = function(student){
  $.ajax({
    type: "DELETE",
    url: '/students/' + student.id + '.json',
    data: student.id
  }).done(
  function(e){
    $('#show-all').empty();
    KickHash.displayStudents();
  });
}
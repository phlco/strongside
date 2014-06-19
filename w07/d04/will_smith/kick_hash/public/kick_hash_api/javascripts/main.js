var HashBook = HashBook || {};

// NEW: I want to fetch all the cats from my database

$(document).ready(function() {
  HashBook.listStudents();
  $("#student-form").on("submit", HashBook.createStudent);
});

HashBook.listStudents = function() {
  $.ajax({
    type: "GET",
    url: "/students.json",
  }).done(function(students) {

    $ul = $("#student-index");

    $.each(students, function(i, student){
      $li = $("<li>")
        .appendTo($ul);

      $name = $("<h3>")
        .text(student["name"])
        .appendTo($li);

      $email = $("<p>")
        .text(student["email"])
        .appendTo($li);

      $imageUrl = $("<img>")
        .attr("src", student["image_url"])
        .appendTo($li);

      $deleteButton = $("<button>")
        .attr("student-id", student["id"])
        .text("Delete Student")
        .appendTo($li)
        .on("click", function(e){
          e.preventDefault();

          var studentId = $(this).attr("student-id");
          var deleteUrl = "/students/"+studentId+".json";

          function deleteCallback(deletedStudent){
            console.log("Deleted Student:");
            console.log(deletedStudent);
          }
            HashBook.listStudents();

          $.ajax({
            type: "DELETE",
            url: deleteUrl
          }).done(deleteCallback);
        });

    });
  });
};

HashBook.createStudent = function(e) {
  e.preventDefault();
  var url = "/students.json";
  var $name = $('input[name="name"]').val();
  var $email = $('input[name="email"]').val();
  var $img = $('input[name="image_url').val();
  $.ajax({
    type: "POST",
    url: url,
    data: { student: {
      name: $name,
      email: $email,
      image_url: $img
    }}
  }).done(HashBook.makeStudentDiv());
  HashBook.clearForm();
};

HashBook.makeStudentDiv = function (student){
  var $div = $('<div>').addClass('student');
  $('body').append($div);
  var $name = $('<p>').text(student.name);
  var $email = $('<p>').text(student.email);
  if(student.image_url && student.image_url !== null){
    var $img = $('<img>').attr("src", student.image_url);
    $div.append($img);
  }
  $div.append($name);
  $div.append($email);
};

HashBook.clearForm = function (){
    $name = $('input[name="name"]').val("");
    $email = $('input[name="email"]').val("");
    $img = $('input[name="image_url').val("");
};







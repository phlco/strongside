$(document).ready(function(){
  //upon load, sends ajax request to grab students
  $.ajax({
    type: "GET",
    url: "/students.json"
  }).done(getStudents)
  //takes the response from ajax request and iterates through the object
  function getStudents(students) {
    var school = $("<div>");
    $.each(students,function(i, student) {
      var studentDiv = $("<div>").attr("class", "student-box");
      var studentName = $("<h4>").attr("class", "student").html(student.name);
      var studentEmail = $("<p>").attr("class", "email").html(student.email);
      var studentImage = $("<img>").attr("src", student.image_url).addClass("picture")
      var button = $("<button>").html("delete");
      studentDiv.append(studentName, studentEmail, studentImage, button);
  //applies event listener to button where the upon click, student will be deleted from the db and object removed from the DOM
  button.on("click", function(e) {
    var button = this;
    e.preventDefault();
    $.ajax({
      type: "DELETE",
      context: button,
      url: "/students/" + student.id + ".json"
    }).done(function(){
      console.log("deleted");
      var $studentDiv = $(this).parent();
      $studentDiv.remove();
    })
  })
  $("body").append(studentDiv);
  })
  }
    //event listener on create student button (attached to form) that allows for creation of new student
    $("#create-student").on("click", studentCreator);

});


//**************** not part of document ready ******************


//function that is called on event listener for creating a student
function studentCreator(e) {
  e.preventDefault();
  var $name = $("#form-name").val();
  var $email = $("#form-email").val();
  var $image = $("#form-image").val();
  var newStudent = {student: {name: $name, email: $email, image_url: $image}};
  $.ajax({
    type: "POST",
    url: "/students.json",
    data: newStudent
  }).done(function(response){
    console.log(response);
  })
}
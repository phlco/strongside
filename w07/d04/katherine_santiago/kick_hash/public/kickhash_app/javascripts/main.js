// var kickhashApp = kickhashApp || {};

$(document).ready(function() {

  console.log("js");
  showStudents();
  $(".add-button").on("click", showAddStudentForm);
  $(".submit").on("click", addStudentToDataBase);


});

function showStudents() {
  $.ajax({
    type: "GET",
    url: "http://localhost:3000/students.json"
  }).done(function(data) {
    var ulTag = $("<ul>");
    $(".students-list").append(ulTag);

    for (var i = 0; i < data.length; i++) {
      var liTag = $("<li>");
      ulTag.append(liTag);

      var student = data[i];
      var name = student.name;
      var email = student.email;
      var imgUrl = student.img_url;
      var info = name + ", " + email + ", " + imgUrl;
      liTag.append(info);

      var deleteButton = $("<button>");
      deleteButton.attr("student-id", student["id"]);
      deleteButton.text("Delete");
      liTag.append(deleteButton);

      deleteButton.on("click", function(e) {
        e.preventDefault();

        var studentId = $(this).attr("student-id");
        var deleteUrl = "/students/" + studentId + ".json";

        $.ajax({
          type: "DELETE",
          url: deleteUrl
        }).done(console.log("deleted student"));

      });
    }
  });
}

function showAddStudentForm() {
  $(".add-student-form").removeClass("hidden");
}

function addStudentToDataBase() {
  console.log("adding");
  var name = $("form").find("input[name='name']").val();
  var email = $("form").find("input[name='email']").val();
  var imgUrl = $("form").find("input[name='img_url']").val();
  var studentParams = {
    student: {
      name: name,
      email: email,
      img_url: imgUrl
    }
  }
debugger // why does this only work with the debugger?!!!!!
  $.ajax({
    type: "POST",
    url: "http://localhost:3000/students.json",
    data: studentParams
  }).done(console.log("yay"));
}

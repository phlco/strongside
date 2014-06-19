var StudentBook = StudentBook || {} // ask Jonathan about object literal or constructor

$(document).ready(function() {
  listStudents();
  $(".submit-student").on("click", submitStudent);
  $(".submit-student").on("click", submitStudent);
})


function listStudents() {
  $.ajax({
    type: "GET",
    url: "/students.json",
  }).done(function(students) {
    // debugger
    var container = $("<div>");
    for (var i = 0; i < students.length; i++) {
      var divTag = $("<div>").addClass("student");
      var nameTag = $("<h3>");
      var emailTag = $("<p>");
      var student = students[i];
      var image = $("<img>").attr("src", student["img_url"]);
      //var deleteButton = $("<button>").attr("id", student["id"]).text("Delete Student")
      // var updateButton = $("<button>").attr("id", student["id"]).text("Update Student").addClass("update");
      nameTag.text(student.name);
      emailTag.text(student.email);
      divTag.append(nameTag);
      divTag.append(emailTag);
      divTag.append(image);
      divTag.append("<br><button id='" + student["id"] + "'> Delete Student</button>")
      // divtag.append(updateButton)
      container.append(divTag)
    }
    $("#students-list").append(container);
  });
}


function submitStudent() {
  var name = $("form").find("input[name='name']").val();
  var email = $("form").find("input[name='email']").val();
  var photo = $("form").find("input[name='img_url']").val();

  var newStudentParams = {
    student: {
      name: name,
      email: email,
      img_url: photo
    }
  }
  $.ajax({
    type: "POST",
    url: "http://localhost:3000/students.json", // If I put "students/new"
    data: newStudentParams
  }).done(alert("sent!"));
}


function deleteStudent() {
  debugger
  alert("Works!");
}







$(document).ready(function(){

  // you better fix this or else
  $.ajaxSetup({
    async: false
  });

  function getStudents(){
    var students = $.get("/students");
    var studentsJSON = students.responseJSON;
    $.each(studentsJSON, function(i, student) {
      var studentDiv = $("<div>")
      .addClass("student")
      .attr('id', student.id);
      studentDiv.html("<h3>" + student.name + "</h3> <br><img src=\"" + student.img_url + "\">" + "<br>" + '<a href="mailto:' +student.email + '">' + student.email + "<br>");
      $deleteButton = $("<input type=\"button\" value=\"delete\">");
      studentDiv.append($deleteButton);
      $updateButton = $('<input type=\"button\" value=\"update\">');
      studentDiv.append($updateButton);
      $("#student-wrapper").append(studentDiv);
    })
  }

  getStudents();

  function addStudent(){
    $name = $("#name").val();
    $imgUrl = $("#img-url").val();
    $email = $("#email").val();
    $student = { student: { name: $name, img_url: $imgUrl, email: $email } };
    $.ajax
    ({
      type: 'POST',
      url: '/students',
      dataType: 'json',
      data: $student
    }).done(function(student){
      console.log(student);
      var studentDiv = $('<div>')
      .addClass("student")
      .attr('id', student.id);
      studentDiv.html("<h3>" + $name + "</h3> <br><img src=\"" + $imgUrl + "\">" + "<br>" + $email);
      $deleteButton = $('<input type=\"button\" value=\"delete\">');
      studentDiv.append($deleteButton);
      $updateButton = $('<input type=\"button\" value=\"update\">');
      studentDiv.append($updateButton);
      $("#student-wrapper").append(studentDiv);
    });
  }

  function showStudentForm(){
    $studentForm = $("<div>");
    $studentForm.html('<input type="text" id="name" placeholder="name"></input><input type="text" id="img-url" placeholder="image URL"></input><input type="text" id="email" placeholder="email"></input><input type="button" id="update-student" value="add a student">');
    $("h2").append($studentForm);
  }

  function showUpdateForm(e){
    $updateForm = $('div');
    $updateForm.html('<input type="text" id="name" placeholder="name"></input><input type="text" id="img-url" placeholder="image URL"></input><input type="text" id="email" placeholder="email"></input><input type="button" id="update-student" value="submit">');
    $(this).parent().append($updateForm);
  }

  $("#new-student-form").on("click", showStudentForm);
  $("h2").on("click", "#add-student", addStudent);
  $("#input[value=update]", showUpdateForm);
  $(".student").on("click", "#update-student", updateStudent);
  $('body').on("click", "input[value=delete]", deleteStudent);

  function deleteStudent(e) {
    console.log('yr deleteStudents function is running');
    var id = $(this).parent().attr('id');
    $("#" + id).remove();
    $.ajax({
      type: 'DELETE',
      url: '/students/' + id,
      dataType: 'json'
    });
  }

  function updateStudent(e){
    console.log('yr updateStudent function is running');
    $name = $("#update-name").val();
    $imgUrl = $("#update-img-url").val();
    $email = $("#update-email").val();
    $student = { student: { name: $name, img_url: $imgUrl, email: $email } };
    var id = $(this).parent().attr('id');
    $.ajax({
      type: 'PUT',
      url: '/students/' + id,
      dataType: 'json',
      data: $student
    });
  }

})
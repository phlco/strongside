var StudentsApp = StudentsApp || {};


StudentsApp.loadStudents = function() {
   $.ajax({
    type: "GET",
    url: "http://localhost:3000/students.json"
  }).done(StudentsApp.displayStudents);
};



StudentsApp.displayStudents = function(data) {
  var $studentsEL = $("#students"),
      $studentsUl = $("<ul />");

  $.each(data, function(){
    var $studentsLi = $("<li />"),
        name = this.name,
        email = this.email,
        image_url = this.image_url,
        student = "";
    $studentsLi = $("<li />");
    student = "Name: " + name;
    //add email and img url
    $studentsLi.text(student);
    $studentsUl.append($studentsLi);
  });
  $studentsEL.append($studentsUl);
};

StudentsApp.newStudent = function(e) {
  e.preventDefault();
  var newStudent = {
      name: $("input[name=name]").val(),
      email: $("input[name=email]").val(),
      image_url: $("input[name=image_url]").val()
    };

  $.ajax({
      type: "POST",
      url: "http://localhost:3000/students",
      data: {student: newStudent},
      dataType: "json",
    }).done(function(data) {
      alert("Student Created!");
    });
};

StudentsApp.updateStudent = function(e) {

};




StudentsApp.addEventListener = function() {
  $("#create_student").on("click", StudentsApp.newStudent);

};


// StudentsApp.displayStudents = function(data) {
//   var $tblStudents = $("tbody");

//   $.each(data, function(){
//     var $tr = $("<tr />"),
//         $tdName = $("<td />"),
//         $tdEmail = $("<td />"),
//         $tdImageUrl = $("<td />");

//     $tdName = this.name;
//     $tdEmail = this.email;
//     $tdImageUrl = this.image_url;
//     debugger
//     $tr.append($tdName);
//     $tr.append($tdEmail);
//     $tr.append($tdImageUrl);
//     $tblStudents.append($tr);
//   });

// };


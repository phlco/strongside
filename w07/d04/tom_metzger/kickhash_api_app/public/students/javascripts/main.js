var Students = Students || {};

$(document).ready(function(){

Students.$allStudents = $("#student-list");

Students.getStudents();



})

// ----------------------------------------------------------------


Students.getStudents = function(){
  $.ajax({
    type: "GET",
    url: "/students",
    dataType: "json"
  }).done(function(data){
    // $.each(data, function(i, stu){
    //   Students.appendStudent(stu)
  })
}

Students.appendStudent = function(stu) {
  var student = $("<section>");
      student.append("<div>" + stu.name + "</div>");
      // student.append("<li>" + stu.age + "</li>");
      student.append("<div><img src='" + stu.image_url + "'></div>");
      student.append("<button class='show'>show</button>");
      $(".delete").on.call(student, "click", Students.showStudent);
      student.append("<button class='update'>update</button>");
      $(".delete").on.call(student, "click", Students.updateStudent);
      student.append("<button class='delete'>delete</button>");
      $(".delete").on.call(student, "click", Students.deleteStudent);
      student.data("id", stu.id);
      Students.$allStudents.append(student);
}


// Students.showStudent = function(id) {
// }


// Students.updateStudent = function(id) {
// }

// Students.deleteStudent = function(id) {
// }


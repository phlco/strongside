$(document).ready(function(){
  getStudents()
  eventListeners()
});

function getStudents() {
  $.ajax({
    type: "GET",
    url: '/students.json'
  }).done(displayStudents);
};

function displayStudents(data) {
  var studentsDiv = $("<div>")
  studentsDiv.addClass("students-div")
  $.each(data, function(i, student) {
    var studentContainer = $("<div>")
    studentContainer.addClass("students")
    var imgUrl = $("<p><a href = 'mailto:" + student.email + "'>" + student.name + "</a></p>")
    var imgframe = $("<div>")
    imgframe.addClass("frame")
    imgframe.append("<img src = '" + student.img_url + "' />")
    studentContainer.append(imgUrl, imgframe)
    studentsDiv.append(studentContainer)
  })
  $('body').append(studentsDiv)
}

function eventListeners() {
  $("#submit").on("click", addNewStudent)
}

function addNewStudent(){
  name = $("#name")[0].value
  email = $("#email")[0].value
  imgUrl = $("#img-url")[0].value

  newStudent = {student: {name: name, email: email, img_url: imgUrl}}
  postStudents(newStudent)
}

function postStudents(newStudent) {
  $.ajax({
    type: "POST",
    data: newStudent,
    url: "/students"
  }).done(createNewStudent()) //not sure if this is the way you do it
}

createNewStudent = function(data) {
  debugger
  var studentsDiv = $("#students-div")
  var studentContainer = $("<div>")
  studentContainer.addClass("students")
  var imgUrl = $("<p><a href = 'mailto:" + data.email + "'>" + data.name + "</a></p>")
    var imgframe = $("<div>")
    imgframe.addClass("frame")
    imgframe.append("<img src = '" + newStudent.img_url + "' />")
    studentContainer.append(imgUrl, imgframe)
    studentsDiv.append(studentContainer)
}

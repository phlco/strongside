function showAll() {
  $.get("/students").done(function(data){
    for(i = 0; i < data.length; i++) {
      $("body").append(data[i].name);
      $("body").append("<br>");
    }
  });
}
function updateStudent(id, data) {
  $.ajax({type: "put",
    url: "/students/" + id,
    data: {student: data}
  });
}
function showStudent(id) {
  $.get("/students/".id).done(function(data){
    $("body").append(data.name);
  });
}
function deleteStudent(id) {
  $.ajax({type: "delete", url: "/students/" + id});
}

function addStudent(student) {
  $.ajax({type: "post",
    url: "/students",
    data: {student: student}
  });
}

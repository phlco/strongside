function testInit() {
  getAllStudents();
  getSingleStudent(1);
  createNewStudent("Jonathan Leung", "Jonathan@Jon.com", "jonathan.com");
  updateStudent(1, "new student hayyy", "someemail@stuff.com", "facebook.com/stuff");
}

function getAllStudents(){
  $.ajax({
    type: "get",
    url: "/students",
    dataType: "json",
  }).done(function(data){
    console.log(data);
    // debugger;
    return data;
  });
}

function getSingleStudent(id) {
  $.ajax({
    type: "get",
    url: "/students/" + id,
    dataType: "json"
  }).done(function(data){
    console.log(data);
    return data;
  });
}

function createNewStudent(name, email, image_url) {
  $.ajax({
    type: "post",
    url: "/students",
    dataType: "json",
    data: {name: name, email: email, image_url: image_url}
  }).done(function(data){
    console.log(data);
    return data;
  });
}

function updateStudent(id, name, email, image_url) {
  $.ajax({
    type: "put",
    url: "/students/" + id,
    dataType: "json",
    data: {name: name, email: email, image_url: image_url}
  }).done(function(data){
    console.log(data);
    return data;
  });
}
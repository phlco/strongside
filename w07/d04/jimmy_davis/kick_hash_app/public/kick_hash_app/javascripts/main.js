$(function() {
   $.ajax({
    type: "GET",
    url: "../students.json",
  }).done(function(data) {
    console.log(data);
    var students = data;

// Each method: students is the data you want to loop through
// then the function => i is each index of the array
// data is the value in the array that you want to get

    $.each(students, function(i, data) {
      var name = data.name;
      var email = data.email;
      var image = data.image_url;
      var $body = $("body");
      var $div = $("<div>").text("Name: " + name);
      var $ul = $("<ul>");
      var $liEmail = $("<li>").text("Email: " + email);
      var $button = $("<button>")
      $button.text("Delete");
      $button.id = "delete";
      $div.append($ul);
      $ul.append($liEmail);
      $div.append($button);
      $body.append($div);
    });
  });
});



$(document).ready(function() {
  $("#submit").on("click", createNewStudent);
});

function createNewStudent(e) {
  e.preventDefault();
  // this takes the values that are inputted into the form
  var $name = $('#student-name').val();
  var $email = $('#student-email').val();
  var $imageUrl = $('#student-image-url').val();

  var newStudentParams = {
    // this stores the above data from createNewStudent and passes it into data in the ajax function
    cat: {
      name: $name,
      email: $email,
      image_url: $imageUrl,
    }
  }

  $.ajax({
    type: "POST",
    url: "../students.json",
    data: newStudentParams
  }).done(postStudent)
}

var postStudent = function(data) {
  console.log(data)
  // I want to append the newly created student to the list without refreshing the page
  // I can definitely refactor this and save it to a function because I use it twice
  var name = data.name;
  var email = data.email;
  var image = data.image_url;
  var $body = $("body");
  var $div = $("<div>").text("Name: " + name);
  var $ul = $("<ul>");
  var $liEmail = $("<li>").text("Email: " + email);
  var $button = $("<button>")
  $button.text("Delete");
  $button.id = "delete";
  $div.append($ul);
  $ul.append($liEmail);
  $div.append($button);
  $body.append($div);
}

// I want to delete a student when I click the delete button

// $(document).ready(function() {
//   $("#delete").on("click", function(){
//     $.ajax({
//       type: "POST",
//       url: "../students.json",
//       data:
//     }).done(function(data){

//     });
//   });
// });


// Update

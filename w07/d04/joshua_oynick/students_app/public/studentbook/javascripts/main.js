$.ajax({
  type: "GET",
  url: "http://localhost:3000/students.json"
}).done(function(response) {
  console.log(response);
  jQuery.each(response, function(i, student) {
    console.log(student.name)
    $( "body").append( "<p>" + student.name + "</p>" );
  });
});

$("form").on("submit", function(e) {
  e.preventDefault();
  console.log("hello");
  var student_info = {
    name: $("input[name=name]").val(),
    email: $("input[name=email]").val(),
    image_url: $("input[name=image_url]").val()
  }

  $.ajax({
    type: "POST",
    url: "http://localhost:3000/students",
    data: {student: student_info},
    dataType: "JSON"
  }).done(function(student){
    console.log(student);
    $( "#students" ).append( "<li>" + student.name + "</li>" );
    $( "#students" ).append( "<li>" + student.email + "</li>" );
    $( "#students" ).append( "<img src=" + student.image_url + ">" );
  })
})

$( document ).ready(function() {
  $('#list-students').on("click", function(){    // ajax request to get all of the students in the database
    $.ajax({
      type: "get",
      url: "/students",
      dataType: "json",
    }) // ajax setup
    .done(function(msg) {    // 'msg' is just for this example. by default, the parameter is the response AJAX gets.
      $(msg).each(function(i, student){
        newStudent = $('<div>').addClass("student").attr("id", student.id);
        newStudent.append("<p>Name: " + student.name + "</p>")
                  .append("<p>Email: " + student.email + "</p>")
                  .append("<img src=" + student.img_url + ">")
                  .append('<input type="button" value="DELETE">').on("click", function() {
                    $.ajax({
                      type: "DELETE",
                      url: "/students/"+$(this).attr("id"),
                      dataType: "json"
                    }) // ajax
                    $(this).hide()
                  }) // on
        $('#body').append(newStudent);
      }) // each
    }) // done
  }) // on


}); // ready

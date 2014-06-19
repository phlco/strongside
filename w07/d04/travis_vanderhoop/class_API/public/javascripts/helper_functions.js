// jQuery's AJAX function
var studentName = "Kilgore Trout",
    studentEmail = "KGT@gmail.com",
    studentImgUrl = "http://fc06.deviantart.net/fs71/f/2010/340/6/9/kilgore_trout_by_neopren-d34c79i.jpg";

$.ajax({
  type: "post",
  url: "/students",
  dataType: "json",
  data: { student: { name: studentName, email: studentEmail, img_url: studentImgUrl } } //this an example hash
}).done(function(msg) {         // 'msg' is just for this example. by default, the parameter is the response AJAX gets.
  console.log(msg);
})

// .done() is the equivelant of waiting for readyState == 4.

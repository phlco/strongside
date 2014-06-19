$(document).ready(function(){

  // you better fix this or else
  $.ajaxSetup({
    async: false
  });

  function getCats(){
    var cats = $.get("/cats");
    var catsJSON = cats.responseJSON;
    $.each(catsJSON, function(i, cat) {
      var name = cat.name;
      var tagLine = cat.tag_line;
      var sex = cat.sex;
      var picUrl = cat.pic_url;
      var rating = cat.rating;
      var catId = cat.id
      var catDiv = $("<div>")
      .addClass("cat")
      .attr('id', catId);
      catDiv.html("<h3>" + cat.name + "</h3>" + cat.sex + "<br><img src=\"" + cat.pic_url + "\">" + "<br>" + cat.tag_line + "<br>");
      $deleteButton = $("<input type=\"button\" value=\"delete\">");
      catDiv.append($deleteButton);
      $("body").append(catDiv);
    })
  }

  function addCat(){
    $name = $("#name").val();
    $tagLine = $("#tag-line").val();
    $sex = $("#sex").val();
    $picUrl = $("#pic-url").val();
    $rating = $("#rating").val();
    $cat = { cat: { name: $name, tag_line: $tagLine, sex: $sex, pic_url: $picUrl, rating: $rating } };
    $.ajax
    ({
      type: 'POST',
      url: '/cats',
      dataType: 'json',
      data: $cat
    }).done(function(cat, text, xhr){
      console.log(cat, text, xhr.response);
      var catDiv = $('<div>');
      catDiv.html("<h3>" + $name + "</h3>" + $sex + "<br><img src=\"" + $picUrl + "\">" + "<br>" + $tagLine);
      $deleteButton = $('<input type=\"button\" value=\"delete\">');
      catDiv.append($deleteButton);
      $("body").append(catDiv);
    });
  }

  getCats();

  $("#add-cat").on("click", addCat);

  $('body').on("click", "input[value=delete]", deleteCat);

})

function deleteCat(e) {
  console.log('my delete button is working');
  var id = $(this).parent().attr('id');
  $("#" + id).remove();
  $.ajax({
    type: 'DELETE',
    url: '/cats/' + id,
    dataType: 'json'
  });
}

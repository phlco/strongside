$(document).ready(function(){
  $("#links").on("click",function(e){
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: "/index.json",
      dataType: "json"
    }).done(function(data){
      links = $('<ul>')
      $('body').append(links)

      links.text(data.links)
      console.log(data.links)
    })
  })

  $("#images").on("click",function(e){
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: "/index.json",
      dataType: "json"
    }).done(function(data){
      console.log(data.images)
      images = $('<ul>')
      $('body').append(images)
      images.text(data.images)
    })
  })
})
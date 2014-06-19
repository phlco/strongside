$(document).ready(function() {

  addListeners();

})

var addListeners = function() {
  $('#links').on('click', function() {
    var url = $('input').val()
    getLinks(url);
  })

  $('#images').on('click', function() {
    var url = $('input').val()
    getImages(url);
  })
};

var getLinks = function() {
  $.ajax({
    type: "GET",
    url: "/scraper/links?url=http://jonl.org/",
    dataType: "json"
  }).done(function(data) {
    $.each(data, function(key, value) {
      $('.body').append("<p>"+value+"</p>")
    })
  })
};

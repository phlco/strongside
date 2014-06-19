$(function() {

  createTiles(100);


  $('.tile').on("mousedown", function(){
    $(this).addClass('green-bg');
    $('.tile').on("mousemove", function() {
      $(this).addClass('green-bg');
    });
  })

  $(".tile").on("mouseup", function() {
    $(this).addClass('painted-green');
    $(".tile").off("mousemove")
  })

  // $('.tile').on("mouseup", function(){
  //   $(this).addClass('green-bg');
  //      $('.tile').off("mousemove", function() {
  //       $(this).addClass('green-bg');
  //      });
  //  });

  // $('.tile').on("mouseout", function(){
  //   $(this).removeClass('green-bg')
  // });

    $('.tile').on("click", function(){
      $(this).addClass('painted-green')
    })




  });


    $.ajax({
      method: "get",
      url: "/messages",
      type: "json"
    }).done


  //call the blocks

  //on hover, change the block background to green
  //off hover, change the block background to white



//functions to be called in window above

function createTiles(numTiles){
  for (var i = 0; i < numTiles; i++) {
    var newTile = $('<div>');
    newTile.addClass('tile');
    $('body').append(newTile);
  }

}



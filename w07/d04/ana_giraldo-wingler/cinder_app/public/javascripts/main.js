$(document).ready(function(){

  function makeCat(){
    var catObject = {
      cat: {
        name: 'Fluffy',
        sex: 'female',
        pic_url: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRlXI0qopdxRfNkGXCdj8qKTY3dAGdQK8wnx75oAFIhmMa_FGiTBg'
      }
    };
    $.ajax({
      type: "POST",
      url: '/cats',
      dataType: 'json',
      data: catObject,
    }).done(function(cat){
      console.log(cat);
    })
  }

  debugger;

  $("#button").on("click", makeCat);
}
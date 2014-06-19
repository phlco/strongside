$( document ).ready(function() {
  $("#new-account-form").hide();
  $("#create-new-account").on("click", function(){
    $("#create-new-account").hide();
    $("#new-account-form").fadeIn();
  }); // new-account-form.on.click

  $("#confirm-new-account").on("click", function(e){
    e.preventDefault();
    var balance = $("#new-account-balance").val(),
        url = $("#new-account-form").attr("action");
        // jQuery's AJAX function
    $.ajax({
      type: "post",
      url: url,
      dataType: "json",
      data: { account: { balance: balance } } //this an example hash
    }).done(function(msg) {         // 'msg' is just for this example. by default, the parameter is the response AJAX gets.
      console.log(msg);
      // var liTag = $('<li>');
      // liTag.text(msg.body);
      $('#user-accounts-list').append(liTag);
    }); // ajax.done



    debugger
  }); // confirm-new-account.on.click


}); // document.ready

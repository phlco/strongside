// Include CSRF Token with every ajax request
$(function(){
  $(document).ajaxSend(function (e, xhr, options) {
    var token = $("meta[name='csrf-token']").attr("content");
    xhr.setRequestHeader("X-CSRF-Token", token);
    console.log('ajax override', xhr);
  });
});

// Backbone Namespacing
window.App = {
  Models      : {},
  Collections : {},
  Views       : {}
};

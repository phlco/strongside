$.ajaxPrefilter( function( options, originalOptions, jqXHR ) {
    options.url = 'http://localhost:3000' + options.url;
    options.crossDomain = true;
  });
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js

$(function() {
  var cat = new Cat();
  cat.getCats();
  $('#create-cat').on('click', function(){
    $('form').slideDown();
  });
  $('form').on('submit', function(e){
    e.preventDefault();
    cat.createCat();
  });
});

function Cat(){
}

Cat.prototype.catTable = $('#cats-table');

Cat.prototype.getCats = function(){
  var self = this;
 $.ajax('cats.json', {
    type: 'get',
    context: self,
    success: function(response){
      $.each(response, function(index, cat){
        self.appendCat(cat);
      });
    }
  });
};

Cat.prototype.createCat = function(){
  var self = this;
  var $form = $('form');
  var $name = $($form.children("[name='name']"));
  var $age = $($form.children("[name='age']"));
  var $tag_line = $($form.children("[name='tag_line']"));
  var $img_url = $($form.children("[name='img_url']"));
  // create cat params
  var newCat = {
    cat: {
      name: $name.val(),
      age: $age.val,
      tag_line: $tag_line.val(),
      img_url: $img_url.val()
    }
  };
  $.ajax('cats.json', {
    type: 'post',
    data: newCat,
    context: self,
    success: function(cat){
      self.appendCat(cat);
    }
  });
  // clear the form
  $form.slideUp();
  $form[0].reset();
};

Cat.prototype.appendCat = function(cat){
  var $catRow = $('<tr>');
  $catRow.append('<td>' + cat.name + '</td>');
  $catRow.append('<td>' + cat.age + '</td>');
  $catRow.append('<td>' + cat.tag_line + '</td>');
  $catRow.append('<td>' + cat.score + '</td>');
  $catRow.append('<td class="delete"><button>Delete</button></td>');
  $catRow.data('cat', cat);
  $('.delete').on('click', 'button', this.destroyCat);
  this.catTable.append($catRow);
};

Cat.prototype.destroyCat = function(){
  var $catNode = $(this).parent().parent();
  var catData = $catNode.data('cat');
  var url = 'cats/' + catData.id;
  $.ajax(url, {
    type: 'delete',
    success: function(response){
      $catNode.fadeOut();
    }
  });
};

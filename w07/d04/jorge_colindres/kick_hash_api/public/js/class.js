function Class(){
  this.$studentsTable = $('#students');
  this.$newStudentForm = $('#newStudent');
  this.getStudents();
  this.showCreateForm();
  this.createFormSubmit();
}

// -----------------
// Event Listeners
// -----------------

Class.prototype.showCreateForm = function(){
  $('#showForm').on('click', function(){
    $('#newStudent').slideToggle();
  });
};

Class.prototype.createFormSubmit = function(){
  var self = this;
  self.$newStudentForm.on('submit', function(e){
    e.preventDefault();
    self.createStudent();
  });
};

Class.prototype.showClicked = function(){
  var self = this;
  self.$studentsTable.on('click', '.show', function(){
    var $studentNode = $(this).parent().parent();
    self.showStudent($studentNode);
  });
};

Class.prototype.editClicked = function(){
  var self = this;
  this.$studentsTable.on('click', '.edit', function(){
    var $studentNode = $(this).parent().parent();
    self.editStudent($studentNode);
  });
};

Class.prototype.deleteClicked = function(){
  var self = this;
  this.$studentsTable.on('click', '.delete', function(){
    var $studentNode = $(this).parent().parent();
    self.destroyStudent($studentNode);
  });
};

// -----------------
// Utility Functions
// -----------------

Class.prototype.appendStudent = function(student){
  var self = this;
  var $studentRow = $('<tr>');
  $studentRow.append('<td>' + student.name);
  $studentRow.append('<td>' + student.email);
  $studentRow.append('<td>' + student.img_url);
  $studentRow.append('<td><button class="show">Show</button></td>');
  $studentRow.append('<td><button class="edit">Edit</button></td>');
  $studentRow.append('<td><button class="delete">Delete</button></td>');
  $studentRow.data('student', student);
  this.$studentsTable.append($studentRow);
};

Class.prototype.updateStudent = function(studentNode, response){
  $(studentNode.children()[0]).html(response.name);
  $(studentNode.children()[1]).html(response.email);
  $(studentNode.children()[2]).html(response.img_url);
};

// -----------------
// CRUD Actions
// -----------------

Class.prototype.getStudents = function(){
  var self = this;
  $.ajax('/students', {
    context: self,
    success: function(response){
      $.each(response, function(index, student){
        self.appendStudent(student);
      });
    }
  });
  this.showClicked();
  this.editClicked();
  this.deleteClicked();
};

Class.prototype.createStudent = function(){
  var self = this;
  // Set up params[:student]
  var newStudentData = {
    student: {
      name: $(self.$newStudentForm.children("[name='name']")).val(),
      email: $(self.$newStudentForm.children("[name='email']")).val(),
      img_url: $(self.$newStudentForm.children("[name='img_url']")).val()
    }
  };
  $.ajax('/students', {
    type: 'post',
    context: self,
    data: newStudentData,
    success: function(response){
      self.appendStudent(response);
      self.$newStudentForm.slideUp();
      self.$newStudentForm[0].reset();
    },
  });
};

Class.prototype.showStudent = function(studentNode){
  var student = studentNode.data('student');
  var $indexSection = $('#index')
                      .fadeOut();
  var $studentNode = $('#student');
  $studentNode.find('h4').html(student.name);
  $studentNode.append('<img id="studentImg" src="' + student.img_url + '">')
              .fadeIn();
  $studentNode.on('click', '.back', function(){
    $studentNode.fadeOut();
    $indexSection.fadeIn();
    $('#studentImg').remove();
  });
};

Class.prototype.editStudent = function(studentNode){
  var self = this;
  var student = studentNode.data('student');
  var $indexSection = $('#index')
                      .fadeOut();
  var $studentEditSection = $('#studentUpdate')
                            .fadeIn();
  var $updateForm = $('#editStudent');
  // Pre-fill the form with data
  $studentEditSection.find('h4').html(student.name);
  $updateForm.children(("[name='name']")).val(student.name);
  $updateForm.children(("[name='email']")).val(student.email);
  $updateForm.children(("[name='img_url']")).val(student.img_url);
  $studentEditSection.on('click', '.back', function(){
    $studentEditSection.fadeOut();
    $indexSection.fadeIn();
  });
  $updateForm.on('submit', function(e){
    // Set up params[:student]
    var newStudentData = {
      student: {
        name: $($updateForm.children("[name='name']")).val(),
        email: $($updateForm.children("[name='email']")).val(),
        img_url: $($updateForm.children("[name='img_url']")).val()
      }
    };
    e.preventDefault();
    $.ajax('/students/' + student.id, {
      type: 'put',
      context: self,
      data: newStudentData,
      success: function(response){
        self.updateStudent(studentNode, response);
        $studentEditSection.fadeOut();
        $indexSection.fadeIn();
        self.editClicked();
      }
    });
  });
};

Class.prototype.destroyStudent = function(student){
  var self = this;
  var studentData = student.data('student');
  $.ajax('/students/' + studentData.id, {
    type: 'delete',
    success: function(){
      student.fadeOut();
    }
  });
};



// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function createFavourite(groupName, groupId, userId, imageUrl) {
  $.ajax({
    type: "POST",
    url: "/pages",
    data: JSON.stringify({
      favourite: {
      group_id: groupId,
      group_name: groupName,
      user_id: userId,
      photo_url: imageUrl
    }
    }),

    contentType: "application/json",
    dataType: "json"
  })

  .success(function(data) {
    var panel = $("<div></div>");
    panel.attr('class', 'panel panel-default');

    var heading = $("<div></div>").html(groupName);
    heading.attr('class', 'panel-heading');

    var label = $('<label></label>').html("Unfavourite this group");
    // label.attr('onClick', 'checkBox(event)');

    var checkbox = $('<input>');
    checkbox.attr('type', 'checkbox');
    // checkbox.attr('onClick', 'checkBox(event)');

    label.append(checkbox);

    var checkboxdiv = $('<div></div>').html(label);

    var photo = $('<img>');
    photo.attr('src', imageUrl);
    photo.attr('class', 'image');

    var body = $('<div></div>').html(checkboxdiv);
    body.attr('class', 'panel-body');

    body.append(photo);

    panel.append(heading, body);

    $('.favourites').append(panel)
  })

  .fail(function(error) {
    errors = JSON.parse(error.responseText).error

    $.each(errors, function(index, value) {
      var errorItem = $("<li></li>").html(value);
      $("#errors").append(errorItem);
    });
  })
}

function submitFavourite(event) {
  debugger

  event.preventDefault();

  var groupElement = $(event.target).parent().parent().parent()
  var id = groupElement.attr('id');
  var groupId = $('#' + id).data("group").groupId;
  var groupName = $('#' + id).data("name").groupName;
  var userId = $('#' + id).data("user").userId;
  var imageParent = $(event.target).parent().parent().siblings('.panel-body').children('a');
  var imageUrl = imageParent.attr('href');

  createFavourite(groupName, groupId, userId, imageUrl);
}

function checkBox(event) {
  event.preventDefault();
  var favouriteElement = $(event.target).parent().parent();
  var id = favouriteElement.attr('id');

  $.ajax({
    type: "PUT",
    url: '/pages/' + id,
    data: JSON.stringify({
      favourite: {
        active: false
      }
    }),

    contentType: "application/json",
    dataType: "json"
  })

  .success(function() {
    $("#" + id).parent().parent().remove();
  })

  .fail(function(error) {
    errors = JSON.parse(error.responseText).error

    $.each(errors, function(index, value) {
      var errorItem = $("<li></li>").html(value);
      $("#errors").append(errorItem);
    });
  })

}


// $(document).on('turbolinks:load', function(){
// });

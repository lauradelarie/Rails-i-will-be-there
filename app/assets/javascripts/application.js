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
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function createFavourite(groupName, groupId, userId) {
  $.ajax({
    type: "POST",
    url: "/pages",
    data: JSON.stringify({
      favourite: {
      group_id: groupId,
      group_name: groupName,
      user_id: userId
    }
    }),

    contentType: "application/json",
    dataType: "json"
  })

  .success(function(data) {
    var newFavourite = $("<li></li>").html(data.favourite.group_name);
    $("#favourites").append( newFavourite );
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
  event.preventDefault();

  var groupElement = $(event.target).parent().parent()
  var id = groupElement.attr('id');
  var groupId = $('#' + id).data("group").groupId;
  var groupName = $('#' + id).data("name").groupName;
  var userId = $('#' + id).data("user").userId;

  createFavourite(groupName, groupId, userId);
}

function checkBox(event) {
  event.preventDefault();

  var favouriteElement = $(event.target).parent()
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
    $("#" + id).remove();
  })

  .fail(function(error) {
    errors = JSON.parse(error.responseText).error

    $.each(errors, function(index, value) {
      var errorItem = $("<li></li>").html(value);
      $("#errors").append(errorItem);
    });
  })

}

// Ajax is like this thing in javascropt that's all like yo I gonna send an http request based on some specifications like type, data, url, etc. When the request finishes usually we get back a string or json object and we usually do some stuff with it

$(document).ready(function() {
  // Creates Horse Form
  $("#new-horse").on("click",function(event){
    event.preventDefault();
    var url= $(this).attr('href');
    var $that = $(this);

    var request = $.ajax({
      type: 'GET',
      url: url
    });

    request.done(function(data){
      $('p').append(data);
    });
  });
// Creates New Horse off of created form
  $("p").on("submit","#horse-form",function(event){
    console.log("yo")
    event.preventDefault();
    var action = $(this).attr('action');
    var $that = $(this);
    var data = $("input[type=text]").serialize()


    var request = $.ajax({
      type: 'POST',
      url: action,
      data: data
    });

    request.done(function(response){
      $('#horse-list').append(response)
      $('#horse-form').remove()
    });
//On Horse Failure
// Controller in Ruby  looks like this:
// (if save fails or w/e)
// status 422
// body "Yooooo" (or partial)
    request.fail(function(response){
      var message = response.responseText
    });
  });

// Shows Horse Stats/Removes Horse Stats
$("#horse-list").on("click","a",function(event){
    event.preventDefault();
    var url= $(this).attr('href');
    var $that = $(this);

    var request = $.ajax({
      type: 'GET',
      url: url,
    });

    request.done(function(response){
      $(".stats").remove();
      $that.closest('div').append(response)
    });
  });




});

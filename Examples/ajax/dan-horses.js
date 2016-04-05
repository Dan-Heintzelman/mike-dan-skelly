$(document).ready(function() {
	$('#new-horse').on("click", function(event){  //Click new horse
		event.preventDefault();
		var url = $(this).attr("href");
		console.log(url);
		$(this).css("display", "none");

		$.ajax({    // conditiional logic if new horse container 
			url: url,
			method: "GET",
		})
		.done(function(response){
			console.log(response);
			$('.container').append(response);
		});
	}); // Event handle click new horse

	$('.container').on("submit", "form#horse-form", function(event){
		event.preventDefault();
		var newHorse = $(this).serialize();
		var url = $(this).attr("action"); // NOTE TO REVIEWER, is this excessive for a route with no wildcards (ex: /horse/:id/new)
		console.log(url);

		$.ajax({
			url: url,
			method: "POST",
			data: newHorse ,
		})
		.done(function(response){
			console.log(response);
			// var horse = response;
			$('#horse-list').append(response);
			$('#new-horse-form-container').hide();
			$('.container').find('#new-horse').css("display", "block"); //css("display", "block");
		});

	}) // Event handle submit horse

	$(".container").on("click", "#horse-list a", function(event){
		event.preventDefault();
		var currentHorse =  $(this).attr('href')
		console.log(currentHorse);

		$.ajax({
			url: currentHorse,
			method: "GET",

		})
		.done(function(response){
			console.log(response);
			$("div#horse-list a[href^='" + currentHorse + "']").append(response);

		})

	})




});  //Document Ready

// Release 0 - Explain AJAX

// 1. What is AJAX?

// There is often a misconception that AJAX is it's own library and/or plugin. However, quite simply, AJAX IS just Javascript. Using AJAX allows us to have an alternative way to send information to and receive from a server without having to refresh a page. This allows the developer to not have to reload content on the page that has already been loaded that is not going to change after a certain "event" takes place. This even could be a click of a link, a submission of a form, or perhaps a change of position of the mouse.

// 2. How to make an AJAX call?

// We have been making AJAX calls using JQUERY, which helps to make ajax requests very easy. Typically, this call is going to happen after an event takes place (within the event handler). Once the event occurs, we call AJAX using:

// $.ajax({  //This is a shortcut for jquery.ajax
// //settings go here
// url: //url where we will send request to
// method: //method type we will use (POST, DELETE, GET, etc)
// data: //data we will send, default data type is text"
// dataType: // Where we can specify an alternate to text, like JSON
// }) 
// .done(function(response){ // This is where we write the code for what happens after inital request is made.
// console.log(response) // see what you are getting back from the server! and make something happen with this data

// }) 

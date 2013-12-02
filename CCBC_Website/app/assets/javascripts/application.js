// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require modernizr-latest
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

jQuery(document).ready(function() {
  setTimeout(function() {
    var source = new EventSource('/source');
    var blank_string = "<span class= 'booked_lawn'></span>";
    var booked_string = "<span class='booked_lawn'>This lawn has been booked</span>";
    var unbooked_string_1 = "<a class='unbooked_lawn' href='./";
    var unbooked_string_2 = "'>Click here to book this lawn!</a>";
    // Initialise all the lawns to be unbookable for the first few seconds
    $('.lawn1').html(blank_string);
    $('.lawn2').html(blank_string);
    $('.lawn3').html(blank_string);
    source.addEventListener('update', function(e) {
      var obj = JSON.parse(e.data);
      if (obj.lawn1booked) {
        $('#lawn1-' + obj.day).html(booked_string);
      } else {
        $('#lawn1-' + obj.day).html(unbooked_string_1 + obj.day + "/book1" + unbooked_string_2);
      }
      if (obj.lawn2booked) {
        $('#lawn2-' + obj.day).html(booked_string);
      } else {
        $('#lawn2-' + obj.day).html(unbooked_string_1 + obj.day + "/book2" + unbooked_string_2);
      }
      if (obj.lawn3booked) {
        $('#lawn3-' + obj.day).html(booked_string);
      } else {
        $('#lawn3-' + obj.day).html(unbooked_string_1 + obj.day + "/book3" + unbooked_string_2);
      }
    });
  }, 1);
});
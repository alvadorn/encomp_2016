/*var getDiff = function (time_now, deadline) {
  var diff =  Date.parse(deadline) - time_now;
  var seconds = Math.floor( (diff/1000) % 60 );
  var minutes = Math.floor( (diff/1000/60) % 60 );
  var hours = Math.floor( (diff/(1000*60*60)) % 24 );
  var days = Math.floor( diff/(1000*60*60*24) );
  return {
    'total': diff,
    'days': days,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  };
}

window.intervals = -1;

$(document).ready(function() {
  if ($(".countdown-timer").length > 0) {
    window.intervals = setInterval(refresh_timer, 1000);
  }
  function refresh_timer() {
    var diff = getDiff(Date.now(), "August 20, 2016 00:00:00 GMT-0300");
    $("#ct-days").html(diff.days);
    $("#ct-hours").html(diff.hours);
    $("#ct-minutes").html(diff.minutes)
    $("#ct-seconds").html(diff.seconds);
  }
});

$(window).unload(function(event) {
  if ($(".countdown-timer").length > 0) {
    clearInterval(window.intervals);
  }
});

document.addEventListener("turbolinks:load", function() {
  if ($(".countdown-timer").length > 0) {
    clearInterval(window.intervals);
  }
})*/

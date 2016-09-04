//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks

var look = "ul.nav.navbar-nav.side-nav li a";
$(look).on('click', function (e) {
    //e.preventDefault();
    $(look).removeClass('active');
    $(look).parent().removeClass('active');
    $(this).addClass('active');
    target = $(this).attr('href');
    //$('.tab-content > div').not(target).hide();
    $(target).fadeIn(600);
});

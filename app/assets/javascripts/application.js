// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require_tree .

//= require Chart.min

//notice, alertは５秒表示
$(function(){
  $('.notice').delay(500).slideDown();
});
$(function(){
  $('.notice').delay(5000).slideUp();
});

$(function(){
  $('.alert').delay(500).slideDown();
});
$(function(){
  $('.alert').delay(5000).slideUp();
});
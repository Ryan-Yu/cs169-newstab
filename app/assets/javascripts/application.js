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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap.min
//= require_tree .

$(document).ready(function(){
  var subscriberFeed = false;
  var interestFeed = false;
  var trendingFeed = false;
  
  $("#subscriber-article-feed").hide();
  $("#interest-article-feed").hide();
  // $("#trending-article-feed").hide();
  
  $("#toggle-subscriber").click(function(){
    subscriberFeed = true;
    interestFeed = false;
    trendingFeed = false;
    
    if (subscriberFeed) {
      $("#subscriber-article-feed").show();
    } else {
      $("#subscriber-article-feed").hide();
    }
    if (interestFeed) {
      $("#interest-article-feed").show();
    } else {
      $("#interest-article-feed").hide();
    }
    if (trendingFeed) {
      $("#trending-article-feed").show();
    } else {
      $("#trending-article-feed").hide();
    }
  });
  
  $("#toggle-recommended").click(function(){
    subscriberFeed = false;
    interestFeed = true;
    trendingFeed = false;
    if (subscriberFeed) {
      $("#subscriber-article-feed").show();
    } else {
      $("#subscriber-article-feed").hide();
    }
    if (interestFeed) {
      $("#interest-article-feed").show();
    } else {
      $("#interest-article-feed").hide();
    }
    if (trendingFeed) {
      $("#trending-article-feed").show();
    } else {
      $("#trending-article-feed").hide();
    }
  });
  
  $("#toggle-trending").click(function(){
    subscriberFeed = false;
    interestFeed = false;
    trendingFeed = true;
    if (subscriberFeed) {
      $("#subscriber-article-feed").show();
    } else {
      $("#subscriber-article-feed").hide();
    }
    if (interestFeed) {
      $("#interest-article-feed").show();
    } else {
      $("#interest-article-feed").hide();
    }
    if (trendingFeed) {
      $("#trending-article-feed").show();
    } else {
      $("#trending-article-feed").hide();
    }
  });
});

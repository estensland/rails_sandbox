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
//= require_tree .
var hashChangeEnabled = true

flyingSwitch = {
  setBindings: function() {
    $(document).on('ready', function(e){
      flyingSwitch.hashChange()
    })

    $(window).on('hashchange', function(e){
      if (hashChangeEnabled ===true){
        flyingSwitch.hashChange()
      }
    })

    $(document).on('click', '.fs-link', function(e){
      hashChangeEnabled = false
      var clicked = this;
      var href = $(clicked).attr('href');
      var method = $(clicked).attr('method');
      if (method === undefined) {method = 'GET'}
      flyingSwitch.AJAXCall(href, method)
    });
  },

  hashChange: function(){
    var hash = window.location.hash
    if (hash) {
      this.AJAXCall(hash, 'GET')
    }
  },
  AJAXCall: function(path, method) {
    if (path.match(/#\/_\//)) {
      var params = path.split('#/_/')[1];
      $.post('/fs/', {fs: params, method: method}, function(partial){
        $('#flying-switch').html(partial);
        hashChangeEnabled = true
      });
    }
    else if (path.match(/#\//)){
      var url = path.split('#/')[1];
      $.ajax({
        type: method,
        url: url,
        success: function(partial){
          $('#flying-switch').html(partial);
          hashChangeEnabled = true;
        }
      })
    }
  }
}

flyingSwitch.setBindings()
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

  $(document).keydown(function(e){
   switch (e.which){
     case 37: // fleche gauche
       $('area[href=left]').trigger('click'); break;
     case 38: // fleche haut
       $('area[href=up]').trigger('click');break; 
     case 39: // fleche droite
       $('area[href=right]').trigger('click'); break;
     case 40: // fleche bas
       $('area[href=down]').trigger('click'); break;
   }
}); 

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

//= require jquery3
//= require popper
//= require bootstrap-sprockets
import "@hotwired/turbo-rails"
import "controllers"
import "preview"

{/* <script>
$(function(){
  var footer = $('footer');
  var pos = $(window).height() - footer.outerHeight();

  footer.css('top', pos);
  
  $(window).on('resize', function(){
    var footer = $('footer');
    var pos = $(window).height() - footer.outerHeight();
    footer.css('top', pos); 
  });
});
</script> */}
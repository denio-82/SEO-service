$(document).on('turbolinks:load', function(){
  $('.pages').on('click', '.show-pages', function(e){
    e.preventDefault();
    $('.show-pages').addClass('hidden');
    $('.pages-table').removeClass('hidden');
    $('.hide-pages').removeClass('hidden');
  });

  $('.pages').on('click', '.hide-pages', function(e){
    e.preventDefault();
    $('.pages-table').addClass('hidden');
    $('.hide-pages').addClass('hidden');
    $('.show-pages').removeClass('hidden');
  });
});
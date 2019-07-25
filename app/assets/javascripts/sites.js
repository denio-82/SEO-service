$(document).on('turbolinks:load', function(){
  $('.robots_txt').on('click', '.show-robots', function(e){
    e.preventDefault();
    $('.show-robots').addClass('hidden');
    $('.robots_file').removeClass('hidden');
  });

  $('.robots_txt').on('click', '.hide-robots', function(e){
    e.preventDefault();
    $('.robots_file').addClass('hidden');
    $('.show-robots').removeClass('hidden');
  });
});